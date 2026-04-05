LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_CFLAGS := -fno-short-enums
LOCAL_SHARED_LIBRARIES := liblog libutils libbinder libhardware libcamera_client libdl
LOCAL_C_INCLUDES += frameworks/base/include system/media/camera/include

# We will name this camera.jet to match your TARGET_PRODUCT
LOCAL_MODULE := camera.jet
LOCAL_MODULE_TAGS := optional

LOCAL_SRC_FILES := CameraWrapper.cpp

include $(BUILD_SHARED_LIBRARY)
