// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "DISwift",
	platforms: [
		.iOS(.v11),
	],
	products: [
		.library(name: "DISwift", targets: ["DISwift"]),
	],
	dependencies: [],
	targets: [
		.target(name: "DISwift", dependencies: [], path: "Sources"),
	]
)
