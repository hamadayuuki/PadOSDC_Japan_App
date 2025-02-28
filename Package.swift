// swift-tools-version: 5.6

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "PadOSDC",
    defaultLocalization: "en",
    platforms: [
        .iOS("15.2")
    ],
    products: [
        .iOSApplication(
            name: "PadOSDC",
            targets: ["AppModule"],
            bundleIdentifier: "hcrane.padosdc.japan.2022",
            teamIdentifier: "R82WJ5W3TV",
            displayVersion: "1.6",
            bundleVersion: "10",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            appCategory: .reference,
            additionalInfoPlistContentFilePath: "Resources/Plist/App.plist"
        )
    ],
    dependencies: [
        .package(url: "https://github.com/crane-hiromu/CombineStorable.git", "1.1.0"..<"1.2.0"),
        .package(url: "https://github.com/noppefoxwolf/SwiftUIWorkaround", "0.0.5"..<"1.0.0"),
        .package(url: "https://github.com/Losiowaty/PlaygroundTester.git", "0.3.1"..<"1.0.0")
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            dependencies: [
                .product(name: "CombineStorable", package: "combinestorable"),
                .product(name: "SwiftUIWorkaround", package: "swiftuiworkaround"),
                .product(name: "PlaygroundTester", package: "playgroundtester")
            ],
            path: ".",
            exclude: ["swiftgen.yml", "README.md", "Makefile", "Resources/Stencil"],
            resources: [
                .process("Resources")
            ],
            swiftSettings: [
                .unsafeFlags(["-Xfrontend", "-warn-long-function-bodies=100"], .when(configuration: .debug)),
                .unsafeFlags(["-Xfrontend", "-warn-long-expression-type-checking=100"], .when(configuration: .debug)),
                .define("TESTING_ENABLED", .when(configuration: .debug))
            ]
        )
    ]
)
