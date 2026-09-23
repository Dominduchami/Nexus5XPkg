int cpu_boot_set_addr(uintptr_t addr, bool arm64);

bool cpu_boot(int node, uint32_t mpidr);

/**
 * cpu_boot_cortex_a_msm8994() -  This function enables msm8994/2 core 
 * @mpidr: This param used to determine which exactly core this function enables
 *
 * As l2 cache for first(boot) cluster enabled by lk1st,
 * this function skips it and work only for second cluster
 */
void cpu_boot_cortex_a_msm8994(uint32_t mpidr);

enum boot_type {
	BOOT_ARM64	    = (1 << (0)), //BIT(0),
	BOOT_ANDROID	= (1 << (1))  //BIT(1),
};