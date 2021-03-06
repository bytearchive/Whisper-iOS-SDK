#
# Be sure to run `pod lib lint NAME.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "Whisper-iOS-SDK"
  s.version          = "0.1.1"
  s.summary          = "Official SDK for Whisper App."
  s.description      = <<-DESC
                       The Whisper-iOS-SDK will let your users create Whisper content
                       from inside your app with just a few lines of code. Currently,
                       we support creating a Whisper post from an Image, Data, file
                       path, or URL, with a custom text overlay.

                       Note that images using the SDK must be at least 640 pixels wide and 920 pixels high.
                       DESC
  s.homepage         = "https://github.com/WhisperApp/Whisper-iOS-SDK"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "Yujin Ariza" => "yujin@whisper.sh" }
  s.source           = { :git => "https://github.com/WhisperApp/Whisper-iOS-SDK.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '6.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes'
  s.resources = 'Pod/Assets/*'

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
