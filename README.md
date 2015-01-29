# rust-dpdk

Rust bindings to [Intel's DPDK](http://dpdk.org/), currently at version 1.8.0.

## Building

To generate the bindings from scratch, use:

```
make BINDGEN=<bindgen> EXTRA_ARGS=<args>
```

The BINDGEN and EXTRA_ARGS parameters are optional, and may be used to specify
the path to the `bindgen` binary, and replace some of the arguments passed to
`bindgen` (include paths etc) respectively.

To use within your own project, use:

```
[dependencies.rust-dpdk]
git = "https://github.com/libpnet/rust-dpdk.git"
```
