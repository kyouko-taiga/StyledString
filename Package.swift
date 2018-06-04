// swift-tools-version:4.0
import PackageDescription

let package = Package(
  name: "StyledString",
  products: [
    .library(name: "StyledString", targets: ["StyledString"]),
  ],
  targets: [
    .target(name: "StyledString", dependencies: []),
    .testTarget(name: "StyledStringTests", dependencies: ["StyledString"]),
  ]
)
