BINDGEN = bindgen
PERL = perl
EXTRA_ARGS = -msse4.2 -I /usr/lib/clang/3.5.1/include

all: src/dpdk.rs

src/dpdk.rs: rte.h
	$(BINDGEN) $(EXTRA_ARGS) -match rte -o src/dpdk.rs rte.h
	$(PERL) -pi -e 's/uint64_t/u64/g' src/dpdk.rs
	$(PERL) -pi -e 's/uint32_t/u32/g' src/dpdk.rs
	$(PERL) -pi -e 's/uint16_t/u16/g' src/dpdk.rs
	$(PERL) -pi -e 's/uint8_t/u8/g' src/dpdk.rs
	$(PERL) -pi -e 's/int64_t/i64/g' src/dpdk.rs
	$(PERL) -pi -e 's/int32_t/i32/g' src/dpdk.rs
	$(PERL) -pi -e 's/int16_t/i16/g' src/dpdk.rs
	$(PERL) -pi -e 's/int8_t/i8/g' src/dpdk.rs
	$(PERL) -pi -e 's/(ssize_t|size_t)/::libc::\1/g' src/dpdk.rs
	$(PERL) -pi -e 's/uintptr_t/::libc::size_t/g' src/dpdk.rs
	$(PERL) -pi -e 's/pthread_t/::libc::pthread_t/g' src/dpdk.rs
	$(PERL) -pi -e 's/FILE/::libc::FILE/g' src/dpdk.rs
	$(PERL) -pi -e 's/Struct_in6_addr/::libc::in6_addr/g' src/dpdk.rs
	$(PERL) -pi -e 's/Struct_in_addr/::libc::in_addr/g' src/dpdk.rs
	$(PERL) -pi -e 's/va_list/::libc::c_void/g' src/dpdk.rs
	$(PERL) -pi -e 's|__m128i|::libc::c_void /* FIXME This is incorrect */|g' src/dpdk.rs
