import PackageDescription

let package = Package(
    name: "VaporKitura",
    dependencies: [
   		.Package(url: "https://github.com/vapor/vapor.git", versions: Version(1,1,0) ..< Version(2,0,0)),
   		.Package(url: "https://github.com/IBM-Swift/Kitura.git", majorVersion: 1, minor: 0)
    ]
)
