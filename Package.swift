// swift-tools-version: 6.2
import PackageDescription

let package = Package(
    name: "AMADocRFIDReadiOS",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "AMADocRFIDReadiOS",
            targets: ["AMADocRFIDReadiOSWrapper"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "2.0.0")),
        .package(url: "https://github.com/AndyQ/NFCPassportReader.git", exact: "2.1.2"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/vbmobile/VBUtils", exact: "3.0.3"),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", exact: "6.0.1"),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocRFIDReadiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRfid/AMADocRFIDReadiOS-2.0.3.zip",
            checksum: "bbae72d8931985796e76b83f4d373cd32decf6e1e95fd11796d0c123193f40d9"
        ),
        .target(
            name: "AMADocRFIDReadiOSWrapper",
            dependencies: [
                .target(name: "AMADocRFIDReadiOS"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                "NFCPassportReader",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "AMAUtils", package: "VBUtils"),
                .product(name: "AMANetworkClient", package: "VBNetworkClient")
            ],
            path: "Sources",
            sources: ["AMADocRFIDReadiOS.swift"]
        )
    ]
)
