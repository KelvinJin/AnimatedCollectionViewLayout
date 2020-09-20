// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "AnimatedCollectionViewLayout",
    platforms: [
        .iOS(.v9)
    ],
    products: [
        .library(
            name: "AnimatedCollectionViewLayout",
            targets: ["AnimatedCollectionViewLayout"])
    ],
    targets: [
        .target(
            name: "AnimatedCollectionViewLayout",
            dependencies: []),
        .testTarget(
            name: "AnimatedCollectionViewLayoutTests",
            dependencies: ["AnimatedCollectionViewLayout"])
    ]
)
