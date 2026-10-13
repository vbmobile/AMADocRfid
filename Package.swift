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
        .package(url: "https://github.com/vbmobile/AMADocModel", .upToNextMinor(from: "4.1.1")),
        .package(url: "https://github.com/vbmobile/AMANFCPassportReader", exact: "2.3.5"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/vbmobile/AMAUtils", .upToNextMinor(from: "3.0.8")),
        .package(url: "https://github.com/vbmobile/AMANetworkClient", .upToNextMinor(from: "7.0.4")),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocRFIDReadiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRFIDReadiOS/AMADocRFIDReadiOS-4.0.2.zip",
            checksum: "1b85000a5ed1d218fe07eed5e703bc4d7e20c45ad0ce9ecda13b1b717f23581a"
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
