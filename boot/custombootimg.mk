LOCAL_PATH := $(call my-dir)

DEVICE_BOOTDIR := device/lge/me1/boot

INSTALLED_RECOVERYIMAGE_TARGET := $(PRODUCT_OUT)/recovery.img
$(INSTALLED_RECOVERYIMAGE_TARGET): \
		$(MKBOOTIMG) \
		$(recovery_ramdisk)
	@echo -e ${CL_CYN}"----- Making recovery image ------"${CL_RST}
	$(hide) $(MKBOOTIMG) \
		--kernel $(PRODUCT_OUT)/kernel \
		--ramdisk $(recovery_ramdisk) \
		--cmdline "$(BOARD_KERNEL_CMDLINE)" \
		--base $(BOARD_KERNEL_BASE) \
		--pagesize $(BOARD_KERNEL_PAGESIZE) \
		$(BOARD_MKBOOTIMG_ARGS) \
		--output $(INSTALLED_RECOVERYIMAGE_TARGET)
	$(call pretty,"Made recovery image: $@")
