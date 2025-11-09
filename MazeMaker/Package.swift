// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MazeMaker",
    products: [
        .library(
            name: "MazeMaker",
            targets: ["MazeMaker"]
        ),
    ],
    targets: [
        .target(
            name: "MazeMaker"
        ),
        .testTarget(
            name: "MazeMakerTests",
            dependencies: ["MazeMaker"]
        ),
    ]
)
