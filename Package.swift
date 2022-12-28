// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PluginExec",
    dependencies: [

    ],
    targets: [
        .executableTarget(
            name: "PluginExec",
            dependencies: [
                "PluginLibrary"
            ]
        ),
        .target(
            name: "PluginLibrary"
        )
    ]
)
