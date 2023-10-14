import PackageDescription

let package = Package(
    name: "AutoLayout-SnapKit",
    platforms: [
        .iOS(.v10),
        .macOS(.v10_12),
        .tvOS(.v10)
    ],
    products: [
        .library(name: "AutoLayout-SnapKit", targets: ["AutoLayout-SnapKit"]),
        .library(name: "AutoLayout-SnapKit-Dynamic", type: .dynamic, targets: ["AutoLayout-SnapKit"]),
    ],
    targets: [
        .target(name: "AutoLayout-SnapKit", path: 'Source')
    ],
    dependencies: [
        .package(url: "https://github.com/SnapKit/SnapKit.git", .upToNextMajor(from: "5.6.0"))
    ],
    swiftLanguageVersions: [
        .v5
    ]
)
