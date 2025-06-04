import ProjectDescription

let project = Project(
    name: "frente-iOS",
    organizationName: "frente",
    options: .options(
        automaticSchemesOptions: .disabled
    ),
    packages: [
        .remote(url: "https://github.com/firebase/firebase-ios-sdk.git", requirement: .upToNextMajor(from: "10.0.0")),
    ],
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
                "UI/Resources/Fonts/**",
                "App/Resources/GoogleService-Info.plist"
            ],
            dependencies: [
                .target(name: "Core"),
                .target(name: "Feature"),
                .target(name: "UI"),
                .package(product: "FirebaseAnalytics"),
                .package(product: "FirebaseAuth"),
                .package(product: "FirebaseAuthCombine-Community"),
                .package(product: "FirebaseFirestore"),
                .package(product: "FirebaseFirestoreCombine-Community"),
                .package(product: "FirebaseStorage"),
                .package(product: "FirebaseStorageCombine-Community"),
            ]
        ),
        
        .target(
            name: "Core",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.frente.core",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Core/Sources/**"]
        ),
        
        .target(
            name: "Feature",
            destinations: [.iPhone],
            product: .framework,
            bundleId: "com.frente.feature",
            deploymentTargets: .iOS("17.0"),
            infoPlist: .extendingDefault(with: [:]),
            sources: ["Feature/Sources/**"],
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