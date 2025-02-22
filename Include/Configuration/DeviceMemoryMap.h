#ifndef _DEVICE_MEMORY_MAP_H_
#define _DEVICE_MEMORY_MAP_H_

#include <Library/ArmLib.h>

#define MAX_ARM_MEMORY_REGION_DESCRIPTOR_COUNT 64

/* Below flag is used for system memory */
#define SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES                               \
  EFI_RESOURCE_ATTRIBUTE_PRESENT | EFI_RESOURCE_ATTRIBUTE_INITIALIZED |        \
      EFI_RESOURCE_ATTRIBUTE_TESTED | EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE |     \
      EFI_RESOURCE_ATTRIBUTE_WRITE_COMBINEABLE |                               \
      EFI_RESOURCE_ATTRIBUTE_WRITE_THROUGH_CACHEABLE |                         \
      EFI_RESOURCE_ATTRIBUTE_WRITE_BACK_CACHEABLE |                            \
      EFI_RESOURCE_ATTRIBUTE_EXECUTION_PROTECTABLE

typedef enum { NoHob, AddMem, AddDev, HobOnlyNoCacheSetting, MaxMem } DeviceMemoryAddHob;

#define MEMORY_REGION_NAME_MAX_LENGTH 64

typedef struct {
  CHAR8                        Name[MEMORY_REGION_NAME_MAX_LENGTH];
  EFI_PHYSICAL_ADDRESS         Address;
  UINT64                       Length;
  DeviceMemoryAddHob           HobOption;
  EFI_RESOURCE_TYPE            ResourceType;
  EFI_RESOURCE_ATTRIBUTE_TYPE  ResourceAttribute;
  EFI_MEMORY_TYPE              MemoryType;
  ARM_MEMORY_REGION_ATTRIBUTES ArmAttributes;
} ARM_MEMORY_REGION_DESCRIPTOR_EX, *PARM_MEMORY_REGION_DESCRIPTOR_EX;

#define MEM_RES EFI_RESOURCE_MEMORY_RESERVED
#define MMAP_IO EFI_RESOURCE_MEMORY_MAPPED_IO
#define SYS_MEM EFI_RESOURCE_SYSTEM_MEMORY

#define SYS_MEM_CAP SYSTEM_MEMORY_RESOURCE_ATTR_CAPABILITIES
#define INITIALIZED EFI_RESOURCE_ATTRIBUTE_INITIALIZED
#define WRITE_COMBINEABLE EFI_RESOURCE_ATTRIBUTE_WRITE_COMBINEABLE
#define UNCACHEABLE EFI_RESOURCE_ATTRIBUTE_UNCACHEABLE

#define Reserv EfiReservedMemoryType
#define Conv EfiConventionalMemory
#define BsData EfiBootServicesData
#define RtData EfiRuntimeServicesData
#define LdData EfiLoaderData
#define MmIO EfiMemoryMappedIO
#define MaxMem EfiMaxMemoryType
#define BsCode EfiBootServicesCode
#define RtCode EfiRuntimeServicesCode

#define NS_DEVICE ARM_MEMORY_REGION_ATTRIBUTE_DEVICE
#define WRITE_THROUGH ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH
#define WRITE_THROUGH_XN ARM_MEMORY_REGION_ATTRIBUTE_WRITE_THROUGH
#define WRITE_BACK ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK
#define WRITE_BACK_XN ARM_MEMORY_REGION_ATTRIBUTE_WRITE_BACK
#define UNCACHED_UNBUFFERED ARM_MEMORY_REGION_ATTRIBUTE_UNCACHED_UNBUFFERED
#define UNCACHED_UNBUFFERED_XN ARM_MEMORY_REGION_ATTRIBUTE_UNCACHED_UNBUFFERED

static ARM_MEMORY_REGION_DESCRIPTOR_EX gDeviceMemoryDescriptorEx[] = {
    /* Name               Address     Length      HobOption        ResourceAttribute    ArmAttributes
                                                          ResourceType          MemoryType */

    /* DDR Regions */
    {"DBI Dump",          0x00010000, 0x00014000, NoHob,  MMAP_IO, INITIALIZED,  Conv,   NS_DEVICE},
    {"DDR Health Mon",    0x00024000, 0x00002000, NoHob,  MMAP_IO, INITIALIZED,  Reserv, NS_DEVICE},
    {"HLOS 0",            0x00100000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK},
    {"UEFI FD",           0x00200000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsCode, WRITE_BACK},
    {"MPPark Code",       0x00300000, 0x00080000, AddMem, MEM_RES, UNCACHEABLE,  RtCode, UNCACHED_UNBUFFERED},
    {"FBPT Payload",      0x00380000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED},
    {"DBG2",              0x00381000, 0x00004000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED},
    {"Capsule Header",    0x00385000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED},
    {"TPM Control Area",  0x00386000, 0x00003000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED},
    {"UEFI Info Block",   0x00389000, 0x00001000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED},
    {"Reset Data",        0x0038A000, 0x00004000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED},
    {"Reser. Uncached0",  0x0038E000, 0x00002000, AddMem, SYS_MEM, SYS_MEM_CAP,  RtData, UNCACHED_UNBUFFERED}, /* It's tricky tricky tricky */
    {"Reser. Uncached0",  0x00390000, 0x00070000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsData, UNCACHED_UNBUFFERED}, /* There goes the other part */
    {"UEFI Stack",        0x00C00000, 0x00040000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsData, WRITE_BACK},
    {"CPU Vectors",       0x00C40000, 0x00010000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsCode, WRITE_BACK},
    {"Reser. Cached 0",   0x00C50000, 0x000B0000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsData, WRITE_BACK},
    {"HLOS 1",            0x00D00000, 0x02700000, AddMem, SYS_MEM, SYS_MEM_CAP,  BsData, WRITE_BACK},
    {"Display Reserved",  0x03400000, 0x01200000, AddMem, MEM_RES, WRITE_THROUGH, MaxMem, WRITE_THROUGH},
    {"HLOS 2",            0x04600000, 0x00A00000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK},
    {"Removed Region 1",  0x05000000, 0x01500000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"TZ Apps",           0x06500000, 0x00500000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"SMEM",              0x06A00000, 0x00200000, AddMem, MEM_RES, UNCACHEABLE,  Reserv, UNCACHED_UNBUFFERED},
    {"Hypervisor",        0x06C00000, 0x00100000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"TZ",                0x06D00000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"MPSS_EFS / SBL",    0x06F00000, 0x00180000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"ADSP_EFS",          0x07080000, 0x00020000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"Removed Region 2",  0x070A0000, 0x00160000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"HLOS 3",            0x07200000, 0x00200000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK},
    {"Subsys Reser. 1",   0x07400000, 0x07B00000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
    {"CNSS_DEBUG",        0x0EF00000, 0x00300000, AddMem, SYS_MEM, SYS_MEM_CAP,  Reserv, NS_DEVICE},
#if USE_MEMORY_FOR_SERIAL_OUTPUT == 1
    {"PStore",            0x0F200000, 0x00800000, AddMem, MEM_RES, WRITE_THROUGH, MaxMem, WRITE_THROUGH},
    {"HLOS 4",            0x0FA00000, 0x10600000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK},
#else
    {"HLOS 4",            0x0F200000, 0x10E00000, AddMem, SYS_MEM, SYS_MEM_CAP,  Conv,   WRITE_BACK},
#endif

    /* RAM partition regions */
    {"RAM Partition",     0x20000000, 0x60000000, AddMem, SYS_MEM, SYS_MEM_CAP, Conv,   WRITE_BACK_XN},

    /* Other memory regions */
    {"IMEM SMEM Base",    0xFE805000, 0x00001000, NoHob,  MMAP_IO, INITIALIZED,  Conv,   NS_DEVICE},
    {"IMEM Cookie Base",  0xFE80F000, 0x00001000, AddDev, MMAP_IO, INITIALIZED,  Conv,   NS_DEVICE},

    /* Register regions */
    {"TERMINATOR",        0xF9000000, 0x00113000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"GCC CLK CTL",       0xFC400000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"RPM MSG RAM",       0xFC428000, 0x00008000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"MMSS",              0xFD800000, 0x001DC000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"MPM2 MPM",          0xFC4A0000, 0x0000C000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"PMIC ARB SPMI",     0xFC4C0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"CRYPTO0 CRYPTO",    0xFD404000, 0x0001C000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"CRYPTO1 CRYPTO",    0xFD444000, 0x0001C000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"CRYPTO2 CRYPTO",    0xFD3C4000, 0x0001C000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"Security Ctrl",     0xFC4B8000, 0x00007000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"SS SDC1/2/3/4",     0xF9800000, 0x000E7000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"SS BLSP1/2",        0xF9900000, 0x00069000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"SS USBOTG",         0xF9A40000, 0x00016000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"SS USB3PHY",        0xF9B38000, 0x00008000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"USB30 PRIM",        0xF9200000, 0x0010D000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"PERIPH_SS_PRNG",    0xF9BFF000, 0x00001000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"TLMM CSR",          0xFD510000, 0x00004000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"TCSR TCSR MUTEX",   0xFD484000, 0x00002000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"TCSR TCSR REGS",    0xFD4A0000, 0x00010000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"PCIE WRAPPER AXI",  0xFF000000, 0x00800000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},
    {"PCIE WRAPPER AHB",  0xFC520000, 0x00008000, AddDev, MMAP_IO, UNCACHEABLE,  MmIO,   NS_DEVICE},

    /* Terminator for MMU */
    {"Terminator", 0, 0, 0, 0, 0, 0, 0}};

#endif
