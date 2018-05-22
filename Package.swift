// swift-tools-version:4.0
import PackageDescription

let package = Package(
    name: "RequestKit",
    products: [
        .library(name: "RequestKit", targets: ["RequestKit"])
    ],
    targets: [
        .target(name: "RequestKit", dependencies: []),
        .testTarget(name: "RequestKitTests", dependencies: ["RequestKit"])
   ]
)
