# AnimatedCollectionViewLayout

Normally a `UICollectionView` has no transition effects when you scroll from one item to another. There are lots of ways to write animations for UICollectionView, but using a UICollectionViewLayout subclass is by far the simplest one. And it doesn't break any of your existing code. You can still use your UICollectionView subclass and you don't need to change your UICollectionViewCell. Just plug and enjoy.

![CI Status](https://travis-ci.org/KelvinJin/AnimatedCollectionViewLayout.svg?branch=master)

<table>
<tr>
<th>Parallax</th>
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

- iOS 9.0+

## Installation

### CocoaPods

To integrate AnimatedCollectionViewLayout into your Xcode project using CocoaPods, specify it in your `Podfile`:

For Swift 4.2 or above:

```ruby
pod 'AnimatedCollectionViewLayout'
```

For Swift 4.1 or below:

```ruby
pod 'AnimatedCollectionViewLayout', '~> 0.3.0'
```

### Carthage & SPM

Carthage and Swift Package Manager are also supported.

## Usage

### Get Started

Import the library where you want to use it. Create a `AnimatedCollectionViewLayout` object, set its `animator` and assign it to your `UICollectionView`.

```swift
import AnimatedCollectionViewLayout

// ...

let layout = AnimatedCollectionViewLayout()
layout.animator = ParallaxAttributesAnimator()
collectionView.collectionViewLayout = layout
```

### Customization

Most of the built-in animators work best in **Paging** mode and they have additional parameters that you can tweak for better transitions.
You can also write your own animators by implementing the protocol `LayoutAttributesAnimator`.

## Author

[Jin Wang](https://twitter.com/jinw1990)


## License

AnimatedCollectionViewLayout is available under the MIT license. See the LICENSE file for more info.
