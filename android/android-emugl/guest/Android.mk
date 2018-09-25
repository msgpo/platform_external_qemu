LOCAL_PATH := $(call my-dir)

# Implementation of enough Android for graphics#################################

# Android libraries
$(call emugl-begin-shared-library,libutils)

$(call emugl-end-module)

$(call emugl-begin-shared-library,libcutils)

$(call emugl-end-module)

$(call emugl-begin-shared-library,liblog)

LOCAL_C_INCLUDES := $(LOCAL_PATH)
LOCAL_SRC_FILES := \
    androidImpl/Log.cpp

$(call emugl-end-module)