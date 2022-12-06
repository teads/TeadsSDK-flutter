#import "TeadsAdmobAdapterPlugin.h"
#if __has_include(<teads_admob_adapter/teads_admob_adapter-Swift.h>)
#import <teads_admob_adapter/teads_admob_adapter-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "teads_admob_adapter-Swift.h"
#endif

@implementation TeadsAdmobAdapterPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [FLTTeadsAdmobAdapterPlugin registerWithRegistrar:registrar];
}
@end
