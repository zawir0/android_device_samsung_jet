#define LOG_TAG "CameraWrapper"
#include <utils/Log.h> 
#include <stdlib.h>
#include <errno.h>
#include <hardware/hardware.h>
#include <hardware/camera.h>
#include <dlfcn.h> 

__attribute__((constructor)) static void wrapper_init(void) {
    LOGE("==================================================");
    LOGE("CAMERA WRAPPER IS ALIVE! THE LINKER LOADED US!");
    LOGE("==================================================");
}

static int camera_device_open(const hw_module_t* module, const char* name,
                hw_device_t** device) {
    int cameraId = atoi(name);
    
    LOGE("==================================================");
    LOGE("%s: ICS is requesting to open camera %d", __FUNCTION__, cameraId);
    
    // 1. Secretly load the closed-source O2Droid blob
    void *libcamera_handle = dlopen("/system/lib/libcamera.so", RTLD_NOW);
    if (!libcamera_handle) {
        LOGE("FATAL: Could not dlopen libcamera.so: %s", dlerror());
        LOGE("==================================================");
        return -38; 
    }
    LOGE("SUCCESS: Loaded O2Droid Froyo libcamera.so!");

    // 2. Search for the Froyo function (NO HAL_ PREFIX, NO ARGUMENTS)
    typedef void* (*open_cam_func)(void); 
    open_cam_func openCameraHardware = (open_cam_func) dlsym(libcamera_handle, "openCameraHardware");

    if (!openCameraHardware) {
        // NOTE: We are now explicitly printing the NEW function name in the error!
        LOGE("FATAL: Could not find openCameraHardware in the blob: %s", dlerror());
        dlclose(libcamera_handle);
        LOGE("==================================================");
        return -38; 
    }
    LOGE("SUCCESS: Found openCameraHardware pointer!");

    // 3. PULL THE TRIGGER! 
    LOGE("PULLING THE TRIGGER: Executing openCameraHardware()...");
    void *legacy_camera_obj = openCameraHardware(); 
    
    if (!legacy_camera_obj) {
        LOGE("FATAL: The Froyo blob failed to initialize the hardware!");
        dlclose(libcamera_handle);
        LOGE("==================================================");
        return -38; 
    }

    LOGE("VICTORY! The Froyo blob woke up the hardware and grabbed /dev/video0!");
    LOGE("==================================================");
    
    return -38; 
}

static int camera_get_number_of_cameras(void) {
    LOGE("%s called", __FUNCTION__);
    return 1;
}

static int camera_get_camera_info(int camera_id, struct camera_info *info) {
    LOGE("%s called for id %d", __FUNCTION__, camera_id);
    info->facing = CAMERA_FACING_BACK;
    info->orientation = 90; 
    return 0;
}

static struct hw_module_methods_t camera_module_methods = {
    /* open */ camera_device_open
};

/* FORCE C-LINKAGE SO ANDROID CAN FIND "HMI" */
extern "C" {
    camera_module_t HAL_MODULE_INFO_SYM = {
        /* common */
        {
            /* tag */ HARDWARE_MODULE_TAG,
            /* version_major */ 1,
            /* version_minor */ 0,
            /* id */ CAMERA_HARDWARE_MODULE_ID,
            /* name */ "Samsung Jet Camera Wrapper",
            /* author */ "zawir0",
            /* methods */ &camera_module_methods,
            /* dso */ NULL,
            /* reserved */ {0},
        },
        /* get_number_of_cameras */ camera_get_number_of_cameras,
        /* get_camera_info */ camera_get_camera_info
    };
}

