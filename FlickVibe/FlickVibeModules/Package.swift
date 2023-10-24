// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FlickVibeModules",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "ApiClient", targets: ["ApiClient"]),
        .library(name: "DesignSystem", targets: ["DesignSystem"]),
        .library(name: "Home", targets: ["Home"]),
        .library(name: "MainTab", targets: ["MainTab"]),
        .library(name: "Models", targets: ["Models"]),
        .library(name: "Search", targets: ["Search"])
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/pointfreeco/swift-composable-architecture",
            from: "1.2.0"
        )
    ],
    targets: [
        // Targets listed in alphabetical order.
        .target(
            name: "ApiClient",
            dependencies: [
                "Models",
                "DesignSystem",
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .target(
            name: "DesignSystem",
            dependencies: ["Models"]
        ),
        .testTarget(
            name: "DesignSystemTests",
            dependencies: ["DesignSystem"]
        ),
        .target(
            name: "Home",
            dependencies: [
                "ApiClient",
                "DesignSystem",
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .target(
            name: "MainTab",
            dependencies: [
                "Home",
                "Search",
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        ),
        .target(
            name: "Models"
        ),
        .target(
            name: "Search",
            dependencies: [
                .product(
                    name: "ComposableArchitecture",
                    package: "swift-composable-architecture"
                )
            ]
        )
    ]
)
