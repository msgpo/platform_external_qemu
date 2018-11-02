
# Autogenerated makefile
# android/android-emugl/host/libs/libOpenglRender/vulkan-registry/xml/genvk.py -registry android/android-emugl/host/libs/libOpenglRender/vulkan-registry/xml/vk.xml cereal -o android/android-emugl/host/libs/libOpenglRender/vulkan/cereal
# Please do not modify directly;
# re-run android/scripts/generate-vulkan-sources.sh,
# or directly from Python by defining:
# VULKAN_REGISTRY_XML_DIR : Directory containing genvk.py and vk.xml
# CEREAL_OUTPUT_DIR: Where to put the generated sources.
# python3 $VULKAN_REGISTRY_XML_DIR/genvk.py -registry $VULKAN_REGISTRY_XML_DIR/vk.xml cereal -o $CEREAL_OUTPUT_DIR

ifeq (true,$(GOLDFISH_OPENGL_SHOULD_BUILD))
ifeq ($(shell test $(PLATFORM_SDK_VERSION) -gt 23 && echo isApi24OrHigher),isApi24OrHigher)

LOCAL_PATH := $(call my-dir)

$(call emugl-begin-static-library,libvulkan_cereal_guest)
$(call emugl-export,C_INCLUDES,$(LOCAL_PATH))
$(call emugl-import,libOpenglSystemCommon)
$(call emugl-import,libOpenglCodecCommon$(GOLDFISH_OPENGL_LIB_SUFFIX))

# Vulkan include dir
ifeq (true,$(GOLDFISH_OPENGL_BUILD_FOR_HOST))
LOCAL_C_INCLUDES += $(HOST_EMUGL_PATH)/host/include
endif

ifneq (true,$(GOLDFISH_OPENGL_BUILD_FOR_HOST))
LOCAL_HEADER_LIBRARIES +=     vulkan_headers 
endif

LOCAL_CFLAGS +=     -DLOG_TAG="goldfish_vulkan"     -Wno-missing-field-initializers     -fvisibility=hidden     -fstrict-aliasing     -DVK_USE_PLATFORM_ANDROID_KHR     -DVK_NO_PROTOTYPES 
LOCAL_SRC_FILES :=     common/goldfish_vk_marshaling.cpp \
    guest/goldfish_vk_frontend.cpp \
    common/goldfish_vk_testing.cpp \
    common/goldfish_vk_deepcopy.cpp \
    common/goldfish_vk_handlemap.cpp \
    common/goldfish_vk_dispatch.cpp \


$(call emugl-end-module)

endif # API 24 or later
endif # GOLDFISH_OPENGL_SHOULD_BUILD

