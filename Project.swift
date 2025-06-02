import ProjectDescription

let project = Project(
    name: "frente-iOS",
    organizationName: "frente",
    options: .options(
        automaticSchemesOptions: .disabled
    ),
    packages: [],
    settings: .settings(
        base: [
            "IPHONEOS_DEPLOYMENT_TARGET": "17.0"
        ],
        configurations: [
            .debug(name: "Debug"),
            .release(name: "Release")
        ],
        defaultSettings: .recommended
    ),
    targets: [
        .target(
            name: "App",
            destinations: [.iPhone],
            product: .app,
            bundleId: "com.frente.app",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .file(path: "App/Resources/Info.plist"),
            sources: ["App/Sources/**"],
            resources: [
                "UI/Resources/Assets.xcassets",
                "UI/Resources/Fonts/**"
            ],
            dependencies: [
                .target(name: "Core"),
                .target(name: "Feature"),
                .target(name: "UI")
            ]
        ),
        
        .target(
            name: "Core",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.frente.core",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Core/Sources/**"],
            resources: ["Core/Resources/**"]
        ),
        
        .target(
            name: "Feature",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.frente.feature",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Feature/Sources/**"],
            resources: ["Feature/Resources/**"],
            dependencies: [
                .target(name: "Core"),
                .target(name: "UI")
            ]
        ),
        
        .target(
            name: "UI",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.frente.ui",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [:]),
            sources: ["UI/Sources/**"],
            resources: [
                "UI/Resources/Assets.xcassets",
                "UI/Resources/Fonts/**"
            ],
            dependencies: [
                .target(name: "Core")
            ]
        )
    ]
) 