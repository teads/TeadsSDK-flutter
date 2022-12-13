#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint teads_sdk_flutter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'teads_sdk_flutter'
  s.version          = '1.0.4'
  s.summary          = 'Teads Flutter iOS plugin'
  s.description      = 'Teads allows you to integrate a single SDK into your app, and serve premium branded ads from Teads SSP'
  s.homepage         = 'https://github.com/teads/TeadsSDK-flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { "Teads" => "support-sdk@teads.tv" }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'TeadsSDK', '>= 5.0.22'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
