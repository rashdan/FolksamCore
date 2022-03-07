// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FolksamCore",
    platforms: [
            .macOS(.v10_14),
            .iOS(.v12),
            .tvOS(.v10),
            .watchOS(.v3)
        ],
    products: [
        .library(
            name: "FolksamCore",
            targets: ["FolksamCore"]),
    ],
    dependencies: [
        .package(name: "Apollo",
                 url: "https://github.com/apollographql/apollo-ios.git",
                 .upToNextMajor(from: "0.43.0"))
    ],
    targets: [
        .target(
            name: "FolksamCore",
            dependencies: [.product(name: "Apollo", package: "Apollo")]),
        .testTarget(
            name: "FolksamCoreTests",
            dependencies: ["FolksamCore"]),
    ]
)
