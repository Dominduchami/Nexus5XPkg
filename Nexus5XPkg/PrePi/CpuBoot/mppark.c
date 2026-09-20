// SPDX-License-Identifier: BSD-3-Clause
/* Copyright (c) 2021-2022, Stephan Gerhold <stephan@gerhold.net> */

/*#include <boot.h>
#include <debug.h>
#include <libfdt.h>

#include <lk2nd/util/cmdline.h>
#include <lk2nd/util/lkfdt.h>
#include <lk2nd/util/mmu.h>
#include <lk2nd/util/psci.h>*/

#include "cpu-boot.h"

#define SMP_SPIN_TABLE_MAGIC	BE64(0x7370696e2d746162)  /* "spin-tab" */

struct smp_spin_table {
	uint8_t code[128] __ALIGNED(128);
	uint64_t magic;
	uint64_t release_addr;
};

static uint8_t spin_code_a64[] = {
	0x5f, 0x20, 0x03, 0xd5,	/* wfe */
	0x3e, 0x04, 0x00, 0x58,	/* ldr	lr, 0x88 */
	0xde, 0xff, 0xff, 0xb4,	/* cbz	lr, 0 */
	0xc0, 0x03, 0x1f, 0xd6,	/* br	lr */
};
static uint8_t spin_code_a32[] = {
	0x02, 0xf0, 0x20, 0xe3,	/* wfe */
	0x7c, 0xe0, 0x9f, 0xe5,	/* ldr	lr, [pc, #124]; 0x88 */
	0x00, 0x00, 0x5e, 0xe3,	/* cmp	lr, #0 */
	0xfb, 0xff, 0xff, 0x0a,	/* beq	0 */
	0x1e, 0xff, 0x2f, 0xe1,	/* bx	lr */
};

/*static struct smp_spin_table *map_reserved_table(const void *dtb)
{
	uint32_t addr, size;
	const char *name;

	dprintf(INFO, "Using reserved memory %s (%#08x size %#x) for SMP spin table\n", name, addr, size);
	if (size < sizeof(struct smp_spin_table)) {
		dprintf(CRITICAL, "Reserved memory %s is too small for SMP spin table (%u < %u)\n",
			name, size, sizeof(struct smp_spin_table));
		return NULL;
	}
	if (addr % __alignof__(struct smp_spin_table)) {
		dprintf(CRITICAL, "Reserved memory %s is not aligned correctly for SMP spin table\n", name);
		return NULL;
	}

	if (!lk2nd_mmu_map_ram_wt("SMP spin table", addr, sizeof(struct smp_spin_table)))
		return NULL;

	return (struct smp_spin_table *)addr;
}*/
#if 0
static void boot_and_setup_cpu(void *dtb, int cpu, int cpus, struct smp_spin_table *smp)
{
	int ret, node;
	uint32_t mpidr;

	ret = lkfdt_get_reg(dtb, cpus, cpu, &mpidr, NULL);
	if (ret < 0) {
		dprintf(CRITICAL, "Failed to read CPU node reg: %d\n", ret);
		return;
	}

	/* Adjust device tree with properties needed for spin-table */
	//ret = fdt_setprop_u64(dtb, cpu, "cpu-release-addr",
	//		      (uintptr_t)&smp->release_addr);

	if (!cpu_boot(dtb, cpu, mpidr))
		return;
}

static int lk2nd_smp_spin_table_setup(void *dtb, const char *cmdline,
				      enum boot_type boot_type)
{
	struct smp_spin_table *smp;
	int cpus, ret, node;

	/* Prepare spin table memory */
	memset(smp, 0, sizeof(*smp));
	if (boot_type & BOOT_ARM64)
		memcpy(smp->code, spin_code_a64, sizeof(spin_code_a64));
	else
		memcpy(smp->code, spin_code_a32, sizeof(spin_code_a32));

	ret = cpu_boot_set_addr((uintptr_t)smp->code, boot_type & BOOT_ARM64);
	if (ret) {
		dprintf(CRITICAL, "Failed to set CPU boot address: %d\n", ret);
		return 0; /* Still continue boot without SMP spin table */
	}

	/* Disable the /psci node if needed */
	node = fdt_path_offset(dtb, "/psci");
	if (node >= 0 && lkfdt_node_is_available(dtb, node)) {
		ret = fdt_setprop_string(dtb, node, "status", "disabled");
		if (ret) {
			dprintf(CRITICAL, "Failed to disable /psci node: %d\n", ret);
			return ret;
		}
	}

	smp->magic = SMP_SPIN_TABLE_MAGIC;
	fdt_for_each_subnode(node, dtb, cpus) {
		const char *name = fdt_get_name(dtb, node, &ret);
		if (!name)
			return ret;
		if (strncmp(name, "cpu@", strlen("cpu@")) == 0) {
			//boot_and_setup_cpu(dtb, node, cpus, smp);
            if (!cpu_boot(dtb, cpu, mpidr)) {
                // DEBUG ERROR
		        return;
            }
        }
	}
	return 0;
}
#endif