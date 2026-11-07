// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "AirTranslate",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(name: "AirTranslate", targets: ["AirTranslate"])
    ],
    targets: [
        .target(name: "AirTranslateCore"),
        .executableTarget(
            name: "AirTranslate",
            dependencies: ["AirTranslateCore"],
            linkerSettings: [
                .linkedFramework("AVFAudio"),
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreAudio"),
                .linkedFramework("ScreenCaptureKit"),
                .linkedFramework("Security"),
                .linkedFramework("Speech"),
                .linkedFramework("Translation")
            ]
        ),
        .testTarget(
            name: "AirTranslateCoreTests",
            dependencies: [
                "AirTranslateCore",
                "AirTranslate"
            ]
        )
    ]
)
