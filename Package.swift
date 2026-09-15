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
        .package(url: "https://github.com/vbmobile/AMADocModel", .upToNextMinor(from: "3.1.0")),
        .package(url: "https://github.com/vbmobile/AMANFCPassportReader", exact: "2.3.3-vb.2"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.4")),
        .package(url: "https://github.com/vbmobile/AMANetworkClient.git", .upToNextMinor(from: "7.0.2")),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocRFIDReadiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRFIDReadiOS/AMADocRFIDReadiOS-3.2.0.zip",
            checksum: "02cd1abb8ea9c3a54154d51b8931d133ba2fbf9fb2327cae07bf8595f910c9dd"
        ),
        .target(
            name: "AMADocRFIDReadiOSWrapper",
            dependencies: [
                .target(name: "AMADocRFIDReadiOS"),
                .product(name: "AMADocModel", package: "AMADocModel"),
                "AMANFCPassportReader",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "AMAUtils", package: "AMAUtils"),
                .product(name: "AMANetworkClient", package: "AMANetworkClient")
            ],
            path: "Sources",
            sources: ["AMADocRFIDReadiOS.swift"]
        )
    ]
)
