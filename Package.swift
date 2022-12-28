// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "PluginExec",
    products: [
        .plugin(
            name: "ThePlugin",
            targets: ["ThePlugin"]
        ),
    ],
    targets: [
        .executableTarget(
            name: "Example",
            plugins: [
                "ThePlugin"
            ]
        ),
        .plugin(
            name: "ThePlugin",
            capability: .buildTool(),
            dependencies: [
                "PluginExec"
            ]
        ),
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
