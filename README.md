# AnimatedCollectionViewLayout

[![CI Status](http://img.shields.io/travis/KelvinJin/AnimatedCollectionViewLayout.svg?style=flat)](https://travis-ci.org/KelvinJin/AnimatedCollectionViewLayout)
[![Version](https://img.shields.io/cocoapods/v/AnimatedCollectionViewLayout.svg?style=flat)](https://cocoapods.org/pods/AnimatedCollectionViewLayout)
[![License](https://img.shields.io/cocoapods/l/AnimatedCollectionViewLayout.svg?style=flat)](https://cocoapods.org/pods/AnimatedCollectionViewLayout)
[![Platform](https://img.shields.io/cocoapods/p/AnimatedCollectionViewLayout.svg?style=flat)](https://cocoapods.org/pods/AnimatedCollectionViewLayout)
[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)

<table>
<tr>
<th>Parallex</th>
<th>ZoomInOut</th>
<th>RotateInOut</th>
<th>Cards</th>
</tr>
<tr>
<td><img src="http://i.imgur.com/v8JuRYj.gif"/></td>
<td><img src="http://i.imgur.com/lLooXQ7.gif"/></td>
<td><img src="http://i.imgur.com/lCNh5mg.gif"/></td>
<td><img src="http://i.imgur.com/joA1emB.gif"/></td>
</tr>
<tr>
<th>CrossFade</th>
<th>Cube</th>
<th>Page</th>
<th></th>
</tr>
<tr>
<td><img src="http://i.imgur.com/U1hOKYo.gif"/></td>
<td><img src="http://i.imgur.com/897mcdm.gif"/></td>
<td><img src="http://i.imgur.com/HRcvRIV.gif"/></td>
<td></td>
</tr>
</table>

## Example

To run the example project, clone the repo, and start `iOS Example` in Xcode.

## Requirements

iOS 8.0+

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate AnimatedCollectionViewLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
use_frameworks!

pod 'AnimatedCollectionViewLayout'
```

Then, run the following command:

```bash
$ pod install
```


### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate AnimatedCollectionViewLayout into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "KelvinJin/AnimatedCollectionViewLayout" ~> 0.1
```

Run `carthage update` to build the framework and drag the built `AnimatedCollectionViewLayout`.framework into your Xcode project.

## TODO

- [ ] Support non-paging mode.
- [ ] Support non-full screen items.  
- [ ] Support item selection notifications.

## Author

Jin Wang


## License

AnimatedCollectionViewLayout is available under the MIT license. See the LICENSE file for more info.
