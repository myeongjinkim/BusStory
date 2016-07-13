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

#include "Data.h"
#import "SearchViewController.h"

#import <sqlite3.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

-(void)checkAndCreateDatabase
{
    BOOL success;
    
    NSFileManager *fileManager = [NSFileManager defaultManager];
    success = [fileManager fileExistsAtPath:self.databasePath];
    
    if(success) {
        return;
    }
    NSString *databasePathFromApp = [[[NSBundle mainBundle]resourcePath] stringByAppendingPathComponent:self.databaseName];
    [fileManager copyItemAtPath:databasePathFromApp toPath:self.databasePath error:nil];
}

-(NSMutableArray *)readDataFromDB:(char*) sql
{
//    [self.bus_stationDB removeAllObjects];
    
    sqlite3 *database;
    
    if(sqlite3_open([self.databasePath UTF8String], &database) == SQLITE_OK) {
        
        //        NSLog(@"---------OPENED");
        
        char *sqlStatement = sql;  //                  ******* 칼럼 선택 ********
        
        sqlite3_stmt *compiledStatement;
        
        if(sqlite3_prepare_v2(database, sqlStatement, -1, &
                              compiledStatement, NULL) == SQLITE_OK) {
            //            NSLog(@"---------PREPARED");
            
            while(sqlite3_step(compiledStatement) == SQLITE_ROW) {
                
                //                NSLog(@"-------STEP IN");
                
                char *bNum = (char *)sqlite3_column_text(compiledStatement, 0);
                char *sName = (char *) sqlite3_column_text(compiledStatement, 1);
                char *sNum = (char *) sqlite3_column_text (compiledStatement, 2);
                char *dir = (char *) sqlite3_column_text (compiledStatement, 3);
                char *stS = (char *) sqlite3_column_text (compiledStatement, 4);
                char *enS = (char *) sqlite3_column_text (compiledStatement, 5);
                char *stT = (char *) sqlite3_column_text (compiledStatement, 6);
                char *enT = (char *) sqlite3_column_text (compiledStatement, 7);

                NSString *busNum = [NSString stringWithUTF8String:bNum];
                NSString *stationName = [NSString stringWithUTF8String:sName];
                NSString *stationNum = [NSString stringWithUTF8String: sNum];
                NSString *direction = [NSString stringWithUTF8String: dir];
                NSString *startStation = [NSString stringWithUTF8String: stS];
                NSString *endStation = [NSString stringWithUTF8String: enS];
                NSString *startTime = [NSString stringWithUTF8String: stT];
                NSString *endTime = [NSString stringWithUTF8String: enT];
                
                Data *data = [[Data alloc] initWithData:busNum busstopname:stationName busstopnum:stationNum busstoplocation:direction startbusstop:startStation endbusstop:endStation firsttime:startTime lasttime:endTime];
//                NSLog(@"%@, %@, %@, %@ %@ %@ %@ %@",data.busNum, stationName, stationNum, direction,startStation,endStation,startTime,endTime);

                [self.busDB addObject:data];
                    
            }
        }
        sqlite3_finalize(compiledStatement);
        //        NSLog(@"---------FINALIZED");
    }
    sqlite3_close(database);
    //    NSLog(@"-----------DB-CLOSED");
    
    return _busDB;
}


#pragma mark - appStarting method
                        
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    self.modelBusStop = [[BusStopModel alloc] init];
    self.modelBusStop.selectedIndex = -1;
    
    self.modelBus = [[BusModel alloc] init];
    self.modelBus.selectedBusStop = -1;
    
    self.modelBookMark = [[BookMarkModel alloc] init];
    self.modelBookMark.selectedBookMark = -1;
    
    self.searchView = [[SearchViewController alloc] init];

    self.busDB = [[NSMutableArray alloc] init];
    self.databaseName = @"bus.db";

    NSArray * documentPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    
    self.databasePath = [documentsDir
                         stringByAppendingPathComponent:self.databaseName];
    
    [self checkAndCreateDatabase];
    
    [self readDataFromDB:"select * from bus_stationInfo"];
    
    self.modelAlarm = [[AlarmModel alloc] init];
    
    
    [launchOptions valueForKey:UIApplicationLaunchOptionsLocalNotificationKey];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
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
