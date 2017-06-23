//
//  AppDelegate.m
//  APNSDemo
//
//  Created by aandrezjewski on 23/06/2017.
//  Copyright © 2017 aandrezjewski. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // will trigger a system popup to the user asking for alert authorization
    UIUserNotificationType apnAcceptedTypes = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings* apnSettings = [UIUserNotificationSettings settingsForTypes:apnAcceptedTypes categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:apnSettings];
    
    [application registerForRemoteNotifications];
    NSLog(@"App is launched");

    return YES;
}

- (void)application:(UIApplication *)app didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    NSLog(@"Houston, we have a pb");
}

- (void)application:(UIApplication *)app didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)devToken {
    // App token is the recipient of the push. Typically forwarded to the APN server.
    NSLog(@"App token received %@", devToken);
}

@end
