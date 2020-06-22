// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SBTUITestTunnel",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "MixboxIpcSbtuiClient", targets: ["MixboxIpcSbtuiServer"]),
        .library(name: "MixboxIpcSbtuiServer", targets: ["MixboxIpcSbtuiServer"]),
    ],
    dependencies: [
        .package(name: "GCDWebServer", url: "https://github.com/SlaunchaMan/GCDWebServer.git",.branch("swift-package-manager")),
    ],
    targets: [
        .target(
            name: "MixboxIpcSbtuiClient",
            dependencies: [.target(name: "MixboxIpcSbtuiCommon")], path: "Pod/Client"),
        .target(
            name: "MixboxIpcSbtuiServer",            
            dependencies: ["GCDWebServer", .target(name: "MixboxIpcSbtuiCommon")],
            path: "Pod/Server"),
        .target(
            name: "MixboxIpcSbtuiCommon",
            path: "Pod/Common",
            publicHeadersPath: "."),
    ]
)
