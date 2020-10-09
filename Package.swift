// swift-tools-version:5.2

import PackageDescription

let package = Package(
    name: "SBTUITestTunnel",
    platforms: [
        .iOS(.v9),
    ],
    products: [
        .library(name: "SBTUITestTunnelClient", type: .static, targets: ["SBTUITestTunnelClient"]),
        .library(name: "SBTUITestTunnelServer", type: .static, targets: ["SBTUITestTunnelServer"]),
    ],
    dependencies: [
        .package(name: "GCDWebServer", url: "https://github.com/SlaunchaMan/GCDWebServer.git",.revision("5cc010813d797c3f40557c740a4f620bf84da4dd")),
    ],
    targets: [
        .target(
            name: "SBTUITestTunnelClient",
            dependencies: [
                .target(name: "SBTUITestTunnelCommon")
            ], path: "Pod/Client",
            publicHeadersPath: "."),
        .target(
            name: "SBTUITestTunnelServer",
            dependencies: [
                "GCDWebServer",
                .target(name: "SBTUITestTunnelCommon")
            ],
            path: "Pod/Server",
            publicHeadersPath: "."),
        .target(
            name: "SBTUITestTunnelCommon",
            path: "Pod/Common",
            publicHeadersPath: "."),
    ]
)
