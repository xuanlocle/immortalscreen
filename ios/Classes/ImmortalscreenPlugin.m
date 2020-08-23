#import "ImmortalscreenPlugin.h"
#import <immortalscreen/immortalscreen-Swift.h>

@implementation ImmortalscreenPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftImmortalscreenPlugin registerWithRegistrar:registrar];
}
@end
