// swift-tools-version: 6.2
import PackageDescription
//
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
        .package(url: "https://github.com/vbmobile/AMADocModeliOS", .upToNextMinor(from: "1.0.0")),
        .package(url: "https://github.com/AndyQ/NFCPassportReader.git", exact: "2.1.2"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/vbmobile/VBUtils", exact: "2.0.2"),
        .package(url: "https://github.com/vbmobile/VBNetworkClient", exact: "5.1.1"),
    ],
    targets: [
        .binaryTarget(
            name: "AMADocRFIDReadiOS",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRfid/AMADocRFIDReadiOS-1.0.0-rc2.zip",
            checksum: "a3380a8260f00b5b1aa046b584df38f442d48f1884bb3b1627b23f4d4827e054"
        ),
        .target(
            name: "AMADocRFIDReadiOSWrapper",
            dependencies: [
                .target(name: "AMADocRFIDReadiOS"),
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                "NFCPassportReader",
                .product(name: "AMADocModeliOS", package: "AMADocModeliOS"),
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "VBUtils", package: "VBUtils"),
                .product(name: "VBNetworkClient", package: "VBNetworkClient")
            ],
            path: "Sources",
            sources: ["AMADocRFIDReadiOS.swift"]
        )
    ]
)
