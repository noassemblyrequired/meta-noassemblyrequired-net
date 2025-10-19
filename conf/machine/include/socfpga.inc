SOC_FAMILY = "socfpga"

require conf/machine/include/arm/armv7a/tune-cortexa9.inc

DEFAULTTUNE = "cortexa9hf-neon"
PREFERRED_PROVIDER_virtual/kernel ?= "linux-altera-lts"
MACHINE_KERNEL_PR = "r1"
KERNEL_IMAGETYPE ?= "zImage"
MACHINE_EXTRA_RECOMMENDS =  " kernel_modules "

