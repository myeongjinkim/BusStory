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
    
    
    [self.window makeKeyAndVisible];
    
    //통지시간 정하기
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComps = [[NSDateComponents alloc] init];
    [dateComps setYear:2011];
    [dateComps setMonth:3];
    [dateComps setDay:22];
    [dateComps setHour:15];
    [dateComps setMinute:30];
    [dateComps setSecond:0];
    NSDate *date = [calendar dateFromComponents:dateComps];
    [dateComps release];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc]init];
    if (localNotif != nil)
    {
        //통지시간
        localNotif.fireDate = date;
        localNotif.timeZone = [NSTimeZone defaultTimeZone];
        
        //Payload
        localNotif.alertBody = [NSString stringWithFormat:@"내부통지 %@",date];
        localNotif.alertAction = @"상세보기";
        localNotif.soundName = UILocalNotificationDefaultSoundName;
        localNotif.applicationIconBadgeNumber = 1;
        
        //Custom Data
        NSDictionary *infoDict = [NSDictionary dictionaryWithObject:@"mypage" forKey:@"page"];
        localNotif.userInfo = infoDict;
        
        //Local Notification 등록
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
        
    }
    [localNotif release];
    
    return YES;
}



- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    
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
