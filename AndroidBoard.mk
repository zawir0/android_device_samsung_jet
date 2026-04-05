LOCAL_PATH := $(call my-dir)

# --- CONFIGURATION ---
# 1. Define the final location on the phone
TARGET_MODULE_PATH := $(TARGET_OUT)/lib/modules/bcmdhd.ko

# 2. Define the source location (from the kernel build output)
#    (We use the same path as before, which points to the compiled object)
KERNEL_MODULE_SRC := $(TARGET_OUT_INTERMEDIATES)/KERNEL_OBJ/drivers/net/wireless/bcmdhd/bcmdhd.ko

# --- THE BUILD RULE ---
# "To create the file at TARGET_MODULE_PATH, you must first finish INSTALLED_KERNEL_TARGET"
$(TARGET_MODULE_PATH): $(INSTALLED_KERNEL_TARGET)
	@echo "Proprietary: Copying bcmdhd.ko to system..."
	@mkdir -p $(dir $@)
	$(hide) cp $(KERNEL_MODULE_SRC) $@

# --- THE HOOK ---
# Crucial Step: Tell the build system "Do not package system.img until this module is ready"
$(INSTALLED_SYSTEMIMAGE_TARGET): $(TARGET_MODULE_PATH)
