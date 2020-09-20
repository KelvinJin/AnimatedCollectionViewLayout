# Change Log
All notable changes to this project will be documented in this file.
`AnimatedCollectionViewLayout` adheres to [Semantic Versioning](http://semver.org/).

## [Master](https://github.com/KelvinJin/AnimatedCollectionViewLayout)
### Added

### Changed

### Removed

## 1.1.0

Released on 2020-09-20

### Changed
  + Fixed an issue where on iOS 14, changing contentView's frame property won't effect. This applies to ParallaxAttributesAnimator and CubeAttributesAnimator.
  + Updated the projects to use Xcode 12.

### Removed 
  + Dropped iOS 8 support.

## 1.0.1
### Changed
  + Fixed an issue where UIKit will reset position but not anchor point of a content view.

## 1.0.0

Released on 2019-10-16

### Changed
  + Supported Swift Package Manager.


## 0.6.0

Released on 2019-03-27

### Changed
  + Updated to support Swift 5.0.
  + Updated project to support Xcode 10.2.

## 0.5.0

Released on 2018-11-30

### Changed
  + Updated the sample project for Xcode 10 with Swift 4.2.
  + Now allowed subclassing AnimatedCollectionViewLayout.

## 0.4.0

Released on 2018-09-19

### Changed
  + Updated for Xcode 10 with Swift 4.2.

## 0.3.0

Released on 2017-05-12

### Changed
  + Changed the deployment targets of both the library and the demo app to 8.0.
  + Fixed a bunch of Xcode warnings.

## 0.2.0

Released on 2017-02-23

### Added

  + Added `SnapInAttributesAnimator`. cddea2f75517fc0ef3e63d05fd2e07c46708fb21
  + Added `scrollDirection`, `startOffset`, `midOffset`, `endOffset` as extra properties to `AnimatedCollectionViewLayoutAttributes`, d539aee9f8a7fff0913a3a2b41d51a41c1811db9
  + More documentations

### Changed

  + [Breaking] Renamed `PagerCollectionViewLayoutAttributes` to `AnimatedCollectionViewLayoutAttributes`. 34cf7a8fa3b2264b52e489520c09ed4d08798b48
  + [Breaking] Renamed `CrossFadeAttributeAnimator` to `CrossFadeAttributesAnimator`. cddea2f75517fc0ef3e63d05fd2e07c46708fb21
  + [Breaking] Renamed `LinearCardAttributeAnimator` to `LinearCardAttributesAnimator`. cddea2f75517fc0ef3e63d05fd2e07c46708fb21
  + [Breaking] Renamed `CubeAttributeAnimator` to `CubeAttributesAnimator`. cddea2f75517fc0ef3e63d05fd2e07c46708fb21
  + [Breaking] Renamed `PageAttributeAnimator` to `PageAttributesAnimator`. cddea2f75517fc0ef3e63d05fd2e07c46708fb21
  + [Breaking] Removed position property from the animator delegate method and put it into `AnimatedCollectionViewLayoutAttributes`. d539aee9f8a7fff0913a3a2b41d51a41c1811db9

### Removed

  + Removed `TurnAttributesAnimator`. 789e5100e5b2e9571ebcd04ac4192cc7760c9232

## 0.1.2

Released on 2017-02-17

### Changed

  + Fixed the issue that Cocoapods failed to include the `Animators` folder #2.

## 0.1.1
Released on 2017-02-09

### Changed

  + [Breaking] Changed `ParallexAttributesAnimator` to `ParallaxAttributesAnimator`

## 0.1.0
Released on 2017-02-09

### Added

  + Implemented the initial version that only supports full screen paging items.
