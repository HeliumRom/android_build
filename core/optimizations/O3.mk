ifeq ($(O3_OPTIMIZATION),true)
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

