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

#import "StationData.h"
#import "BusData.h"
#import "SearchViewController.h"

#import <sqlite3.h>
@interface AppDelegate ()

@end

@implementation AppDelegate

@synthesize databaseName, databasePath, busDB, bus_stationDB, station_timeDB;

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

-(NSMutableArray *)readDataFromDB: (char *)sql :(NSString *)tableName
{
    [self.busDB removeAllObjects];
    
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
                
                if ([tableName  isEqual: @"bus_stationInfo"]){
                    char *bNum = (char *)sqlite3_column_text(compiledStatement, 0);
                    char *sName = (char *) sqlite3_column_text(compiledStatement, 1);
                    char *sNum = (char *) sqlite3_column_text (compiledStatement, 2);
                    NSString *busNum = [NSString stringWithUTF8String:bNum];
//                                    NSLog(busNum);
                    NSString *stationName = [NSString stringWithUTF8String:sName];
//                                    NSLog(stationName);
                    NSString *stationNum = [NSString stringWithUTF8String: sNum];
//                                    NSLog(stationNum);
                    
                    StationData *stationData = [[StationData alloc] initWithData:busNum theStationName:stationName theStationNum:stationNum];
                    [self.busDB addObject:stationData];
                }
                else {
                    char *bN = (char *)sqlite3_column_text(compiledStatement, 0);
                    char *sS = (char *) sqlite3_column_text(compiledStatement, 1);
                    char *eS = (char *) sqlite3_column_text (compiledStatement, 2);
                    char *sT = (char *) sqlite3_column_text (compiledStatement, 3);
                    char *eT = (char *) sqlite3_column_text (compiledStatement, 4);
                    
                    NSString *busNum = [NSString stringWithUTF8String:bN];
                    NSString *startStation = [NSString stringWithUTF8String:sS];
                    NSString *endStation = [NSString stringWithUTF8String: eS];
                    NSString *startTime = [NSString stringWithUTF8String: sT];
                    NSString *lastTime = [NSString stringWithUTF8String: eT];
                    
//                    NSLog(busNum, startStation, endStation, startTime, lastTime);
                    
                    BusData *busData = [[BusData alloc]initWithData:busNum theStartStn:startStation theEndStn:endStation theStartTm:startTime theLastTm:lastTime];
                    [self.busDB addObject:busData];
                }
            }
        }
        sqlite3_finalize(compiledStatement);
        //        NSLog(@"---------FINALIZED");
    }
    sqlite3_close(database);
    //    NSLog(@"-----------DB-CLOSED");
    
    return busDB;
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
    self.stationData = [[StationData alloc] init];
    
    self.bus_stationDB = [[NSMutableArray alloc] init];
    self.station_timeDB = [[NSMutableArray alloc] init];
    self.databaseName = @"bus.db";
    
    NSArray * documentPaths =
    NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDir = [documentPaths objectAtIndex:0];
    
    self.databasePath = [documentsDir
                         stringByAppendingPathComponent:self.databaseName];
    
    [self checkAndCreateDatabase];
    
    
    bus_stationDB = [self readDataFromDB:"select * from bus_stationInfo" :@"bus_stationInfo"];
    station_timeDB = [self readDataFromDB:"select * from station_timeInfo" :@"station_timeInfo"];
    
    //
    
    

    
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
