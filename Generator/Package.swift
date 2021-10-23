// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Generator",
    
    dependencies: [
        .package(url: "https://github.com/scinfu/SwiftSoup", .upToNextMajor(from: "2.0.0")),
        .package(url: "https://github.com/ptrkstr/Slab", .upToNextMajor(from: "1.0.0")),
        .package(url: "../", from: "1.0.0") // Devices
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "Generator",
            dependencies: ["Devices", "SwiftSoup", "Slab"],
            resources: [
                .process("Resources")
            ]
        )
    ]
)
