<p align="center">
    <img 
        src="https://cloud.githubusercontent.com/assets/1342803/19397095/555eebc2-9214-11e6-8f4e-9cea44554717.png" 
        align="center" 
        alt="Core"
        width="500px"
    >
</p>

# Kitura Provider

![Swift](http://img.shields.io/badge/swift-3.0-brightgreen.svg)
[![Build Status](https://travis-ci.org/vapor/kitura-provider.svg?branch=master)](https://travis-ci.org/vapor/kitura-provider)
[![CircleCI](https://circleci.com/gh/vapor/kitura-provider.svg?style=shield)](https://circleci.com/gh/vapor/kitura-provider)
[![Code Coverage](https://codecov.io/gh/vapor/kitura-provider/branch/master/graph/badge.svg)](https://codecov.io/gh/vapor/kitura-provider)
[![Codebeat](https://codebeat.co/badges/a793ad97-47e3-40d9-82cf-2aafc516ef4e)](https://codebeat.co/projects/github-com-vapor-kitura-provider)
[![Slack Status](http://vapor.team/badge.svg)](http://vapor.team)

The Kitura provider for Vapor allows you to use IBM's Kitura HTTP server in your [Vapor](https://github.com/vapor/vapor) application.

## 🚀 Setup

Add the `kitura-provider` package to your `Package.swift`.

```swift
import PackageDescription

let package = Package(
    name: "VaporApp",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/vapor/kitura-provider.git", majorVersion: 1, minor: 0),
    ]
)
```

> Note: This package requires Vapor 1.1 or later.

### Provider

Once the package is added, you can add the provider to your Droplet.

```swift
import Vapor
import VaporKitura

let drop = Droplet()

try drop.addProvider(VaporKitura.Provider.self)
```

The provider adds a configurable server called `"kitura"`. To use the server, edit your `Config/droplet.json` file.

```json
{
	...,
    "server": "kitura"
    ...
}
```

### Manual

If you are not using configuration files, or you would like to hard-code the Kitura server to your Droplet, you can set the server directly.

```swift
import Vapor
import VaporKitura

let drop = Droplet()

drop.server = KituraServer.self
```

## 📖 Documentation

Visit the Vapor web framework's [documentation](http://docs.vapor.codes) for more instructions on how to use this package. 

## 💧 Community

Join the welcoming community of fellow Vapor developers in [slack](http://vapor.team).

## 🔧 Compatibility

This package has been tested on macOS and Ubuntu.
