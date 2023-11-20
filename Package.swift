// swift-tools-version: 5.9

import PackageDescription

let package = Package(
    name: "SwiftPoppler",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "SwiftPoppler",
            targets: ["SwiftPoppler"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser.git", branch: "main")
    ],
    targets: [
        .systemLibrary(
            name: "CxxPoppler",
            pkgConfig: "poppler-cpp",
            providers: [ .brew([ "poppler" ]) ]
        ),
        .target(
            name: "SwiftPoppler",
            dependencies: ["CxxPoppler"],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        ),
        .executableTarget(
            name: "poppler-tool",
            dependencies: [
                "SwiftPoppler",
                .product(name: "ArgumentParser", package: "swift-argument-parser")
            ],
            swiftSettings: [.interoperabilityMode(.Cxx)]
        )
    ]
)
