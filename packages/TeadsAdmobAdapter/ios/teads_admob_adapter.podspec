#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint teads_admob_adapter.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'teads_admob_adapter'
  s.version          = '1.0.0'
  s.summary          = 'AdMob Adapter for Teads\' iOS SDK'
  s.description      = 'Use this adapter to include AdMob as a demand source in your mediation waterfall'
  s.homepage         = 'https://github.com/teads/TeadsSDK-flutter'
  s.license          = { :file => '../LICENSE' }
  s.author           = { "Teads" => "support-sdk@teads.tv" }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.dependency 'TeadsAdMobAdapter', '>= 5.0.23'
  s.dependency 'google_mobile_ads'
  s.dependency 'teads_sdk_flutter'
  s.platform = :ios, '10.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'
end
