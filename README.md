<div align="center">
  <img src="Assets/logo/logo.svg" height=150pt/>
    <h1 style="border-bottom: none">
        Devices      
    </h1>
  <br>
  <div>
      <a href="https://swiftpackageindex.com/ptrkstr/Devices"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fptrkstr%2FDevices%2Fbadge%3Ftype%3Dplatforms"/></a>
      <a href="https://swiftpackageindex.com/ptrkstr/Devices"><img src="https://img.shields.io/endpoint?url=https%3A%2F%2Fswiftpackageindex.com%2Fapi%2Fpackages%2Fptrkstr%2FDevices%2Fbadge%3Ftype%3Dswift-versions"/></a>
      <br>
      <a href="https://github.com/apple/swift-package-manager" alt="Devices on Swift Package Manager"><img src="https://img.shields.io/badge/Swift%20Package%20Manager-compatible-brightgreen.svg" /></a>
      <a href="https://github.com/ptrkstr/Devices/actions/workflows/swift.yml"><img src="https://github.com/ptrkstr/Devices/actions/workflows/Update Code Coverage.yml/badge.svg"/></a>
      <a href="https://codecov.io/gh/ptrkstr/Devices"><img src="https://codecov.io/gh/ptrkstr/Devices/branch/develop/graph/badge.svg?token=UiVsVkDNYA"/></a>
  </div>
    <br>
  <p>
    Swift package that contains all devices from https://www.theiphonewiki.com/wiki/Models
  </p>
</div>

## Usage

Each device has an `all` property. Use this to find, filter, map etc. The following are some examples.

### Find the generation of current device

```swift
let identifier = // Use a method shown in ## Alternatives
let iPhone = iPhone.all.first { $0.identifier == identifier }
iPhone.generation // iPhone 11 Pro Max
```

### List all available colors of the iPad Air 2 64 GB

```swift
let colors = iPadAir.all.filter {
    $0.generation == "iPad Air 2" &&
    $0.storage == "64 GB"
}.map { $0.finish }
Set(colors).sorted() // ["Gold", "Silver", "Space Gray"]
```

### List all Apple Watch Identifiers

```swift
let identifiers = AppleWatch.all.map { $0.identifier }
Set(identifiers).sorted() // ["Watch1,1", "Watch1,2", "Watch2,3", ...]
```

### List all models of the iPad mini 2, iPad4,5, Silver 16 GB

```swift
let iPad = iPadMini.all.first {
    $0.identifier == "iPad4,5" &&
    $0.finish == "Silver" &&
    $0.storage == "16 GB"
}!
iPad.model.components(separatedBy: ", ") // ["ME814", "ME818", "MF074", "MF075", "MF076", "MF544"]
```

See FAQ for why `Set` is used in some examples.

## Installation

### SPM
Add the following to your project:  
```
https://github.com/ptrkstr/Slab
```

## FAQ

### What are the list of devices and properties I can access?

You can see them by going to [Types](/Sources/Devices/Types).

### Why can I see duplicated devices? I.e. iPad Air has 3 sets of Silver 16 GB.

That's because a lot of device models are released slightly differently depending on the region i.e. in China, iPhones can come with two sim card slots as opposed to western regions which either include 1 slot [and an esim]. Those different devices tend to have a different "A" number, FCC ID, Identifier and Model. If you're performing searches for Finish/Color or Storage, you may want to remove duplicates.

### Why are some of the returned values a question mark or Unknown?

The data may not (yet) be available.

### How can I split values that contains commas or newlines?

The model field sometimes contains multiple model names. These can be split with `.model.components(separatedBy: ", ")`
The identifier field sometimes contains multiple identifiers. These can be split with `.identifier.components(separatedBy: "\n")`

### How quickly will this update when Apple releases new devices?

A check is run every day to see if [this](https://www.theiphonewiki.com/wiki/Models) list of devices has changed. If so, a pull request is raised and I'll be notified to review it. You can expect a delay of a few days at the very most.

## Alternatives

- [How to determine the current iPhone/device model?](https://stackoverflow.com/questions/26028918/how-to-determine-the-current-iphone-device-model)
- [How to get device make and model on iOS?](https://stackoverflow.com/questions/11197509/how-to-get-device-make-and-model-on-ios)
