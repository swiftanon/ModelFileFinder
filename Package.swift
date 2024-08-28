// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ModelFileFinder",
    platforms: [
        .iOS(.v17),
        .macOS(.v14),
    ],
    products: [
        .library(
            name: "ModelFileFinder",
            targets: ["ModelFileFinder"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/nicklockwood/SwiftFormat", from: "0.54.0"),
    ],
    targets: [
        .target(
            name: "ModelFileFinder"
        ),
        .testTarget(
            name: "ModelFileFinderTests",
            dependencies: ["ModelFileFinder"]
        ),
    ]
)
