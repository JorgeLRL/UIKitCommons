#
# Be sure to run `pod lib lint UIKitCommons.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'UIKitCommons'
  s.version          = '1.0.0'
  s.summary          = 'Generic and reusable views.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
  'Generic and reusable views.'
                       DESC

  s.homepage         = 'https://github.com/luisMan97/UIKitCommons'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'luisMan97' => 'riveraladinojorgeluis@gmail.com' }
  s.source           = { :git => 'https://github.com/luisMan97/UIKitCommons.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.source_files = 'UIKitCommons/Classes/**/*.swift'
  s.swift_version = '5.0'
  
  # s.resource_bundles = {
  #   'UIKitCommons' => ['UIKitCommons/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
