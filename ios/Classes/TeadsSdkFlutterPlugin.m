#import "TeadsSdkFlutterPlugin.h"
#if __has_include(<teads_sdk_flutter/teads_sdk_flutter-Swift.h>)
#import <teads_sdk_flutter/teads_sdk_flutter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "teads_sdk_flutter-Swift.h"
#endif

@implementation TeadsSdkFlutterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftTeadsSdkFlutterPlugin registerWithRegistrar:registrar];
}
@end
