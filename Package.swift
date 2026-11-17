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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", exact: "2.0.3"),
        .package(url: "https://github.com/vbmobile/AMANFCPassportReader", exact: "2.1.3"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/vbmobile/VBUtils", exact: "2.0.3"),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", exact: "5.1.1"),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocRFIDReadiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRFIDReadiOS/AMADocRFIDReadiOS-2.0.12.zip",
            checksum: "453000adc85afc1827466e7b11c2128b0b1d46e2182bb986882d4a8a4e4a39de"
        ),
        .target(
            name: "AMADocRFIDReadiOSWrapper",
            dependencies: [
                .target(name: "AMADocRFIDReadiOS"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "NFCPassportReader", package: "AMANFCPassportReader"),
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "VBUtils", package: "VBUtils"),
                .product(name: "VBNetworkClient", package: "VBNetworkClient")
            ],
            path: "Sources",
            sources: ["AMADocRFIDReadiOS.swift"]
        )
    ]
)
