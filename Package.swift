// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "Poppler",
    platforms: [ .macOS(.v12) ],
    products: [
        .library(
            name: "Poppler",
            targets: ["Poppler"]
        ),
    ],
    targets: [
        .systemLibrary(
            name: "CxxLibrary",
            pkgConfig: "poppler-cpp",
            providers: [ .brew([ "poppler" ]) ]
        ),
        .target(
            name: "CWrapper",
            dependencies: [ "CxxLibrary" ],
            cSettings: [
                .unsafeFlags([
                    "-fcxx-modules"     // needed to allow C++ modules
                ])]
        ),
        .target(
            name: "Poppler",
            dependencies: [ "CWrapper" ]
        ),
        .testTarget(
            name: "PopplerTests",
            dependencies: ["Poppler"]),
    ],
    cxxLanguageStandard: .cxx20
)
