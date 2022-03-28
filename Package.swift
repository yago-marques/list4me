// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "list4me",
    dependencies: [
        .package(
            url: "https://github.com/QiuZhiFei/swift-commands.git", .upToNextMajor(from: "0.6.0")
        ),
        
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .executableTarget(
            name: "list4me",
            dependencies: [
                .product(name: "Commands", package: "swift-commands")
            ]
        ),
        .testTarget(
            name: "list4meTests",
            dependencies: ["list4me"]
        )
    ]
)
