// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ContactSupportKit",
    platforms: [
         .iOS(.v13)
    ],
    products: [
        .library(
            name: "ContactSupportKit",
            targets: ["ContactSupportKit"]
        ),
    ],
    targets: [
        .target(
            name: "ContactSupportKit",
            resources: [.process("Resources")]
        ),
        .testTarget(
            name: "ContactSupportKitTests",
            dependencies: ["ContactSupportKit"]
        ),
    ]
)
