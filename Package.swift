import PackageDescription

let package = Package(
    name: "VaporKitura",
    dependencies: [
   		.Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
   		.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7)
    ]
)
