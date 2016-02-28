ifeq ($(GCC_O3),true)
HE_CFLAGS_ARM := \
	-O2 \
	-fomit-frame-pointer \
	-fstrict-aliasing    \
	-funswitch-loops

HE_CFLAGS_THUMB := \
	-mthumb \
	-Os \
	-fomit-frame-pointer \
	-fno-strict-aliasing

HE_CFLAGS := \
	-DNDEBUG \
	-Wstrict-aliasing=2 \
	-fgcse-after-reload \
	-frerun-cse-after-loop \
	-frename-registers

HE_CPPFLAGS := \
	-fvisibility-inlines-hidden
else
HE_CFLAGS_ARM := \
	-O2 \
	-fomit-frame-pointer \
	-fstrict-aliasing    \
	-funswitch-loops

HE_CFLAGS_THUMB := \
	-mthumb \
	-Os \
	-fomit-frame-pointer \
	-fno-strict-aliasing

HE_CFLAGS := \
	-DNDEBUG \
	-Wstrict-aliasing=2 \
	-fgcse-after-reload \
	-frerun-cse-after-loop \
	-frename-registers

HE_CPPFLAGS := \
	-fvisibility-inlines-hidden

ifeq ($(CLANG_O3),true)
HE_CLANG_CFLAGS := \
	-O3 \
	-Qunused-arguments \
	-Wno-unknown-warning-option

HE_CLANG_CPPFLAGS := \
	-O3 \
	-Qunused-arguments \
	-Wno-unknown-warning-option \
	-D__compiler_offsetof=__builtin_offsetof

HE_CLANG_LDFLAGS := -Wl,--sort-common
else
HE_CLANG_CFLAGS :=
HE_CLANG_CPPFLAGS :=
HE_CLANG_LDFLAGS :=
endif

