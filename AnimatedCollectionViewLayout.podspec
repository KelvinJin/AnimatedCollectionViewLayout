Pod::Spec.new do |s|
  s.name = 'AnimatedCollectionViewLayout'
  s.version = '1.1.0'
  s.license = { :type => 'MIT', :file => 'LICENSE' }
  s.summary = 'A UICollectionViewLayout subclass that adds custom
  transitions/animations to the UICollectionView'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  A normal UICollectionView has no transition effects when you scroll from one
  item to another. There are lots of ways to write animations for
  UICollectionView, but using a UICollectionViewLayout subclass is by far the
  simplest one. And it doesn't break any of your existing code. You can still
  use your UICollectionView subclass and you don't need to change your
  UICollectionViewCell. Just plug and enjoy.
                       DESC

  s.homepage = 'https://github.com/KelvinJin/AnimatedCollectionViewLayout'
  s.authors = { 'Jin Wang' => 'jinw1990@gmail.com' }
  s.source = { :git => 'https://github.com/KelvinJin/AnimatedCollectionViewLayout.git', :tag => s.version }
  s.ios.deployment_target = '9.0'
  s.source_files = 'Sources/**/*.swift'
  s.swift_versions = ['5.0', '5.1']
end
