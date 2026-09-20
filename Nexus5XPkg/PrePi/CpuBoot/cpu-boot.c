// SPDX-License-Identifier: BSD-3-Clause
/* Copyright (c) 2021-2022, Stephan Gerhold <stephan@gerhold.net> */

/*#include <bits.h>
#include <debug.h>
#include <platform/timer.h>
#include <scm.h>*/
#include <Library/DebugLib.h>
#include <Library/TimerLib.h>
#include <Library/LKEnvLib.h>
#include <Library/MallocLib.h>
//#include <Library/QcomSmcLib.h>

#include "scm.h"
#include "CpuBoot.h"

#include <Chipset/scm.h>

#define HACK 0

#define QCOM_SCM_BOOT_SET_ADDR		0x01
#define QCOM_SCM_BOOT_FLAG_COLD_ALL	(0 | BIT(0) | BIT(3) | BIT(5))
#define QCOM_SCM_BOOT_SET_ADDR_MC	0x11
#define QCOM_SCM_BOOT_MC_FLAG_AARCH64	BIT(0)
#define QCOM_SCM_BOOT_MC_FLAG_COLDBOOT	BIT(1)
#define QCOM_SCM_BOOT_MC_FLAG_WARMBOOT	BIT(2)

#define BITS(x, high, low) ((x) & (((1<<((high)+1))-1) & ~((1<<(low))-1)))
#if 1
/* From Linux Kernel asm/system.h */
#define __asmeq(x, y)  ".ifnc " x "," y " ; .err ; .endif\n\t"

// MOVE -----------------------------------------------------------------
static uint32_t scm_call_a32(uint32_t x0, uint32_t x1, uint32_t x2, uint32_t x3, uint32_t x4, uint32_t x5, scmcall_ret *ret)
{
	register uint32_t r0 __asm__("r0") = x0;
	register uint32_t r1 __asm__("r1") = x1;
	register uint32_t r2 __asm__("r2") = x2;
	register uint32_t r3 __asm__("r3") = x3;
	register uint32_t r4 __asm__("r4") = x4;
	register uint32_t r5 __asm__("r5") = x5;
	register uint32_t r6 __asm__("r6") = 0;

	do {
		__asm__ volatile(
			/*__asmeq("%0", "r0")
			__asmeq("%1", "r1")
			__asmeq("%2", "r2")
			__asmeq("%3", "r3")
			__asmeq("%4", "r0")
			__asmeq("%5", "r1")
			__asmeq("%6", "r2")
			__asmeq("%7", "r3")
			__asmeq("%8", "r4")
			__asmeq("%9", "r5")
			__asmeq("%10", "r6")*/
			"smc    #0\n"
			: "=r" (r0), "=r" (r1), "=r" (r2), "=r" (r3)
			: "r" (r0), "r" (r1), "r" (r2), "r" (r3), "r" (r4), "r" (r5), "r" (r6));
	} while(r0 == 1);

	if (ret)
	{
		ret->x1 = r1;
		ret->x2 = r2;
		ret->x3 = r3;
	}

	return r0;
}
//SmInternalCallCommand(const struct scm_command *cmd)
uint32_t scm_call2(scmcall_arg *arg, scmcall_ret *ret)
{
	uint32_t *indir_arg = NULL;
	uint32_t x5;
	int i;
	uint32_t rc;

	arg->x0 = arg->atomic ? (arg->x0 | SCM_ATOMIC_BIT) : arg->x0;
	x5 = arg->x5[0];

	if ((arg->x1 & 0xF) > SCM_MAX_ARG_LEN - 1)
	{
		indir_arg = memalign(CACHE_LINE, ROUNDUP((SCM_INDIR_MAX_LEN * sizeof(uint32_t)), CACHE_LINE));
		ASSERT(indir_arg);

		for (i = 0 ; i < SCM_INDIR_MAX_LEN; i++)
		{
			indir_arg[i] = arg->x5[i];
		}
		arch_clean_invalidate_cache_range((addr_t) indir_arg, ROUNDUP((SCM_INDIR_MAX_LEN * sizeof(uint32_t)), CACHE_LINE));
		x5 = (addr_t) indir_arg;
	}

	rc = scm_call_a32(arg->x0, arg->x1, arg->x2, arg->x3, arg->x4, x5, ret);

	if (rc)
	{
		dprintf(CRITICAL, "SCM call: 0x%x failed with :%x\n", arg->x0, rc);
		return rc;
	}
#if HACK
	if (indir_arg)
		free(indir_arg);
#endif
	return 0;
}
// -----------------------------------------------------------------------
#endif

/*int cpu_boot_set_addr(uintptr_t addr, bool arm64)
{
	uint32_t aarch64 = arm64 ? QCOM_SCM_BOOT_MC_FLAG_AARCH64 : 0;
	scmcall_arg arg = {
		.x0 = MAKE_SIP_SCM_CMD(SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR_MC),
		.x1 = MAKE_SCM_ARGS(6),
		.x2 = addr,
		.x3 = ~0UL, .x4 = ~0UL, .x5 = {~0UL, ~0UL, // All CPUs
		aarch64 | QCOM_SCM_BOOT_MC_FLAG_COLDBOOT},
	};

	if (is_scm_armv8_support())
		return scm_call2(&arg, NULL);

	dprintf(INFO, "Falling back to legacy QCOM_SCM_BOOT_SET_ADDR call\n");
	return scm_call_atomic2(SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR,
				QCOM_SCM_BOOT_FLAG_COLD_ALL, addr);
}*/
int cpu_boot_set_addr(uintptr_t addr, bool arm64)
{
    uint32_t aarch64 = arm64 ? QCOM_SCM_BOOT_MC_FLAG_AARCH64 : 0;
	scmcall_arg arg = {
		.x0 = MAKE_SIP_SCM_CMD(SCM_SVC_BOOT, QCOM_SCM_BOOT_SET_ADDR_MC),
		.x1 = MAKE_SCM_ARGS(6),
		.x2 = addr,
		.x3 = ~0UL, .x4 = ~0UL, .x5 = {~0UL, ~0UL, // All CPUs
		aarch64 | QCOM_SCM_BOOT_MC_FLAG_COLDBOOT},
	};

	return scm_call2(&arg, NULL);
    //return SmInternalCallCommand(const struct scm_command *cmd)
}

static inline uint32_t read_mpidr(void)
{
	uint32_t res;
	__asm__ ("mrc p15, 0, %0, c0, c0, 5" : "=r" (res));
	return BITS(res, 23, 0);
}

bool cpu_boot(int node, uint32_t mpidr)
{
	//uint32_t extra_reg __UNUSED;

	if (mpidr == read_mpidr()) {
		dprintf(CRITICAL, "Skipping boot of current CPU (%x)\n", mpidr);
        DEBUG((EFI_D_LOAD | EFI_D_INFO, "Skipping boot of current CPU (%x)\n", mpidr));
		return true;
	}
    DEBUG((EFI_D_LOAD | EFI_D_INFO, "NOT skipping boot of CPU (%x)\n", mpidr));//for 1 it is equal so idk??

	cpu_boot_cortex_a_msm8994(mpidr);//gets stuck, might be cause of mpidr being wrong??

    DEBUG((EFI_D_LOAD | EFI_D_INFO, "CPU booted!\n"));

	/* Give CPU some time to boot */
	//udelay(100);
    MicroSecondDelay(100);
	return true;
}