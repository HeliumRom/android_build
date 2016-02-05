# Copyright (C) 2014-2015 UBER
# Copyright (C) 2014-2015 HeliumRom Project
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
#
# GCC_OPTI
ifndef LOCAL_IS_HOST_MODULE
ifeq ($(LOCAL_CLANG),)
ifneq (1,$(words $(filter $(LOCAL_DISABLE_GCCONLY), $(LOCAL_MODULE))))
ifdef LOCAL_CONLYFLAGS
LOCAL_CONLYFLAGS += \
	$(GCC_ONLY)
else
LOCAL_CONLYFLAGS := \
	$(GCC_ONLY)
endif
ifdef LOCAL_CPPFLAGS
LOCAL_CPPFLAGS += \
	$(GCC_ONLY)
else
LOCAL_CPPFLAGS := \
	$(GCC_ONLY)
endif
endif
endif
endif

LOCAL_DISABLE_GCCONLY := \
    libopus\
	bluetooth.default \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	$(NO_OPTIMIZATIONS)

ifeq (arm,$(TARGET_ARCH))
GCC_ONLY := \
	-fira-loop-pressure \
	-fforce-addr \
	-funsafe-loop-optimizations \
	-funroll-loops \
	-ftree-loop-distribution \
	-fsection-anchors \
	-ftree-loop-im \
	-ftree-loop-ivcanon \
	-ffunction-sections \
	-fgcse-las \
	-fgcse-sm \
	-fweb \
	-ffp-contract=fast \
	-mvectorize-with-neon-quad \
	-funswitch-loops \
	-fpredictive-commoning \
	-fgcse-after-reload \
	-ftree-loop-vectorize \
	-ftree-slp-vectorize \
	-fvect-cost-model \
	-ftree-partial-pre \
	-fipa-cp-clone
else
GCC_ONLY := \
	-fira-loop-pressure \
	-fforce-addr \
	-funsafe-loop-optimizations \
	-funroll-loops \
	-ftree-loop-distribution \
	-fsection-anchors \
	-ftree-loop-im \
	-ftree-loop-ivcanon \
	-ffunction-sections \
	-fgcse-las \
	-fgcse-sm \
	-fweb \
	-ffp-contract=fast \
	-mvectorize-with-neon-quad \
	-funswitch-loops \
	-fpredictive-commoning \
	-fgcse-after-reload \
	-ftree-loop-vectorize \
	-ftree-slp-vectorize \
	-fvect-cost-model \
	-ftree-partial-pre \
	-fipa-cp-clone
endif

# NO OPTIMIZATION
LOCAL_BLUETOOTH_BLUEDROID := \
  bluetooth.default \
  libbt-brcm_stack \
  audio.a2dp.default \
  libbt-brcm_gki \
  libbt-utils \
  libbt-qcom_sbc_decoder \
  libbt-brcm_bta \
  bdt \
  bdtest \
  libbt-hci \
  libosi \
  ositests \
  libbt-vendor \
  libbluetooth_jni

ifndef NO_OPTIMIZATIONS
  NO_OPTIMIZATIONS := $(LOCAL_BLUETOOTH_BLUEDROID) libadbd
else
  NO_OPTIMIZATIONS += $(LOCAL_BLUETOOTH_BLUEDROID) libadbd
endif
