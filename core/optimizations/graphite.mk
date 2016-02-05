# Copyright (C) 2014-2015 The SaberMod Project
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
# Graphite
  GRAPHITE_FLAGS := \
	-fgraphite \
	-fgraphite-identity \
	-floop-flatten \
	-floop-parallelize-all \
	-ftree-loop-linear \
	-floop-interchange \
	-floop-strip-mine \
	-floop-block \
	-Wno-error=maybe-uninitialized

ifneq (1,$(words $(filter $(LOCAL_DISABLE_GRAPHITE),$(LOCAL_MODULE))))
  ifdef LOCAL_CONLYFLAGS
    LOCAL_CONLYFLAGS += $(GRAPHITE_FLAGS)
  else
    LOCAL_CONLYFLAGS := $(GRAPHITE_FLAGS)
  endif

  ifdef LOCAL_CPPFLAGS
    LOCAL_CPPFLAGS += $(GRAPHITE_FLAGS)
  else
    LOCAL_CPPFLAGS := $(GRAPHITE_FLAGS)
  endif

  ifndef LOCAL_LDFLAGS
    LOCAL_LDFLAGS  := $(GRAPHITE_FLAGS)
  else
    LOCAL_LDFLAGS  += $(GRAPHITE_FLAGS)
  endif
endif

    # Force disable some modules that are not compatible with graphite flags.
    # Add more modules if needed for devices in device/sm_device.mk or by ROM in product/rom_product.mk with
    # LOCAL_DISABLE_GRAPHITE:=
  
LOCAL_DISABLE_GRAPHITE := \
	libunwind \
	libFFTEm \
	libicui18n \
	libskia \
	libvpx \
	libmedia_jni \
	libstagefright_mp3dec \
	libart \
	libstagefright_amrwbenc \
	libpdfium \
	libpdfiumcore \
	libwebviewchromium \
	libwebviewchromium_loader \
	libwebviewchromium_plat_support \
	libjni_filtershow_filters \
	fio \
	libwebrtc_spl \
	libpcap \
	libFraunhoferAAC \
	libhwui \
	libinput \
	libmedia \
	libswscale \
	libavcodec \
	libavformat \
	libft2 \
	libncurses

    # Check if there's already something set somewhere.
    ifndef LOCAL_DISABLE_GRAPHITE
      LOCAL_DISABLE_GRAPHITE := \
        $(LOCAL_BASE_DISABLE_GRAPHITE)
    else
      LOCAL_DISABLE_GRAPHITE += \
        $(LOCAL_BASE_DISABLE_GRAPHITE)
    endif

# modules that need -Wno-error=maybe-uninitialized
ifdef MAYBE_UNINITIALIZED
  ifeq (1,$(words $(filter $(MAYBE_UNINITIALIZED),$(LOCAL_MODULE))))
    ifdef LOCAL_CFLAGS
      LOCAL_CFLAGS += -Wno-error=maybe-uninitialized
    else
      LOCAL_CFLAGS := -Wno-error=maybe-uninitialized
    endif
  endif
endif

#####
