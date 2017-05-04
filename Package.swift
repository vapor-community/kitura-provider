import PackageDescription

let package = Package(
    name: "VaporKitura",
    dependencies: [
   		.Package(url: "https://github.com/vapor/vapor.git", Version(2,0,0, prereleaseIdentifiers: ["beta"])),
   		.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 7)
    ]
)
