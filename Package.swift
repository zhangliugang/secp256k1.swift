// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "secp256k1",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "secp256k1",
            targets: ["secp256k1"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "libsecp256k1",
            path: "./Sources",
            exclude: [
                "secp256k1/examples",
                "secp256k1/build-aux",
                "secp256k1/obj",
                "secp256k1/sage",
                "secp256k1/src/asm",
                "secp256k1/src/testrand_impl.h",
                "secp256k1/src/testrand.h",
                "secp256k1/src/tests_exhaustive.c",
                "secp256k1/src/valgrind_ctime_test.c",
                "secp256k1/src/tests.c",
                "secp256k1/src/gen_context.c",
                "secp256k1/src/bench_ecmult.c",
                "secp256k1/src/bench.h",
                "secp256k1/src/bench.c",
                "secp256k1/src/bench_internal.c",
                "secp256k1/src/modules/ecdh/tests_impl.h",
                "secp256k1/src/modules/recovery/tests_impl.h",
                "secp256k1/src/modules/extrakeys/tests_impl.h",
                "secp256k1/src/modules/schnorrsig/tests_impl.h",
                "secp256k1/src/precompute_ecmult.c",
                "secp256k1/src/precompute_ecmult_gen.c",
                "exporter"
            ],
            sources: [
                ".",
                "secp256k1/src",
                "secp256k1/include",
                "secp256k1/contrib",
                "secp256k1/src/modules/ecdh",
                "secp256k1/src/modules/recovery",
                "secp256k1/src/modules/extrakeys",
                "secp256k1/src/modules/schnorrsig"
            ],
            publicHeadersPath: "secp256k1/include",
            cSettings: [
                .headerSearchPath("secp256k1/src"),
                .unsafeFlags(["-DENABLE_MODULE_ECDH", "-DENABLE_MODULE_EXTRAKEYS", "-DENABLE_MODULE_SCHNORRSIG"])
            ]
        ),
        .target(
            name: "secp256k1",
            dependencies: ["libsecp256k1"],
            path: "./Sources/exporter",
            sources: ["."]
        ),
        .testTarget(
            name: "secp256k1Tests",
            dependencies: ["secp256k1"]
        ),
    ]
)
