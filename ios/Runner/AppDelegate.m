#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import <AMapFoundationKit/AMapFoundationKit.h>

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
  // Override point for customization after application launch.
   [AMapServices sharedServices].apiKey = @"b815c1702a908e49d4cc0b4ef9c73111";
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
