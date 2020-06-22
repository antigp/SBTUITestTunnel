// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SBTUITestTunnel",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "SBTUITestTunnelClient", targets: ["SBTUITestTunnelClient"]),
        .library(name: "SBTUITestTunnelServer", targets: ["SBTUITestTunnelServer"]),
    ],
    dependencies: [
        .package(name: "GCDWebServer", url: "https://github.com/SlaunchaMan/GCDWebServer.git",.branch("swift-package-manager")),
    ],
    targets: [
        .target(
            name: "SBTUITestTunnelClient",
            dependencies: [
                .target(name: "SBTUITestTunnelCommon")
            ], path: "Pod/Client"),
        .target(
            name: "SBTUITestTunnelServer",
            dependencies: [
                "GCDWebServer",
                .target(name: "SBTUITestTunnelCommon")
            ],
            path: "Pod/Server"),
        .target(
            name: "SBTUITestTunnelCommon",
            path: "Pod/Common",
            publicHeadersPath: "."),
    ]
)
