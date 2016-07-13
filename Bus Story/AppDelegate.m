//
//  AppDelegate.m
//  WorldPhotos
//
//  Created by Abraham Park on 6/22/16.
//  Copyright © 2016 ebadaq.com. All rights reserved.
//

#import "AppDelegate.h"
#import "BusStopModel.h"
#import "BusModel.h"
#import "BookMarkModel.h"
#import "AlarmModel.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.modelBusStop = [[BusStopModel alloc] init];
    self.modelBusStop.selectedIndex = -1;
    
    self.modelBus = [[BusModel alloc] init];
    self.modelBus.selectedBusStop = -1;
    
    self.modelBookMark = [[BookMarkModel alloc] init];
    self.modelBookMark.selectedBookMark = -1;
    
    self.modelAlarm = [[AlarmModel alloc] init];
    self.modelAlarm.selectedAlarm= -1;
    self.modelAlarm.selectedRemain=@"";
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    UILocalNotification *notification = [[UILocalNotification alloc]init];
    [notification setAlertBody:@"알람이오"];
    [notification setFireDate:[NSDate dateWithTimeIntervalSinceNow:10]];
    [notification setTimeZone:[NSTimeZone defaultTimeZone]];
    [application setScheduledLocalNotifications:[NSArray arrayWithObjects:notification,nil]];

    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}




@end
