// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Devices",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Devices",
            targets: ["Devices"]),
    ],
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/ptrkstr/Slab", .upToNextMajor(from: "1.0.0")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Devices",
            dependencies: ["Slab"]),
        .testTarget(
            name: "DevicesTests",
            dependencies: ["Devices", "SwiftSoup", "Slab"],
            resources: [
                .process("Resources")
            ]
        ),
         .executableTarget(
             name: "Generator",
             dependencies: ["Devices", "SwiftSoup", "Slab"],
             resources: [
                 .process("Resources")
             ]
         )
    ]
)
