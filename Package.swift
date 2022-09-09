// swift-tools-version: 5.7
import PackageDescription

let package = Package(
    name: "License",
    products: [
        .library(
            name: "License",
            targets: ["License"]
        ),
    ],
    targets: [
        .target(
            name: "License"
        )
    ]
)
