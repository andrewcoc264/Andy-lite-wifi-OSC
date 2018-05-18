# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
ifneq ($(findstring banyan, $(MTK_PROJECT)),)
	LOCAL_MODULE := WIFI_RAM_CODE_SOC
else ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), conn_soc)
ifneq ($(filter $(MTK_PLATFORM), MT6582 MT6592 MT6572),)
# --------------------------------------------------------------------
# MT6572/82/92 Wi-Fi Firmware
# --------------------------------------------------------------------
    LOCAL_MODULE := WIFI_RAM_CODE_SOC
else ifeq ($(MTK_PLATFORM), MT8127)
# --------------------------------------------------------------------
# MT8127 Wi-Fi Firmware
# --------------------------------------------------------------------
    LOCAL_MODULE := WIFI_RAM_CODE_8127 
else ifeq ($(MTK_PLATFORM), MT6571)
# --------------------------------------------------------------------
# MT6571 Wi-Fi Firmware
# --------------------------------------------------------------------
    LOCAL_MODULE := WIFI_RAM_CODE_6571    
else ifeq ($(MTK_PLATFORM), MT6752)
# --------------------------------------------------------------------
# MT6752 Wi-Fi Firmware
# --------------------------------------------------------------------
    LOCAL_MODULE := WIFI_RAM_CODE_6752
endif
else ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), MT6628)
	LOCAL_MODULE := WIFI_RAM_CODE_MT6628
else ifeq ($(strip $(BOARD_CONNECTIVITY_MODULE)), MT6630)
	LOCAL_MODULE := WIFI_RAM_CODE_MT6630
else
$(error no firmware for project=$(MTK_PROJECT), platform=$(MTK_PLATFORM)!)
endif

LOCAL_MODULE_CLASS := ETC
LOCAL_MODULE_PATH := $(TARGET_OUT_ETC)/firmware
LOCAL_SRC_FILES := $(LOCAL_MODULE)
include $(BUILD_PREBUILT)

