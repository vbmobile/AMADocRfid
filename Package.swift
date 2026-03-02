// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AMADocRfid",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "AMADocRfid", targets: ["AMADocRfid"])
    ],
    dependencies: [
        .package(url: "https://github.com/AndyQ/NFCPassportReader.git", exact: "2.1.2"),
        .package(url: "https://github.com/CocoaLumberjack/CocoaLumberjack.git", from: "3.8.0"),
        .package(url: "https://github.com/vbmobile/VBUtils", exact: "2.0.2"),
    ],
    targets: [
        .binaryTarget(
            name: "VBDocumentReader",
            url: "https://vbmobileidstorage.blob.core.windows.net/ios/AMADocRfid/VBDocumentReader-0.1.0.zip",
            checksum: "1f167ee867cb1ac61e77a6b07133d322f8f11db4aa16076b17d029923d37b499"
        ),
        .target(
            name: "AMADocRfid",
            dependencies: [
                .target(name: "VBDocumentReader"),
                "NFCPassportReader",
                .product(name: "CocoaLumberjackSwift", package: "CocoaLumberjack"),
                .product(name: "VBUtils", package: "VBUtils"),
            ]
        )
    ],
    swiftLanguageModes: [.v6]
)

