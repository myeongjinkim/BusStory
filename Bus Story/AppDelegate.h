//
//  AppDelegate.h
//  WorldPhotos
//
//  Created by Abraham Park on 6/22/16.
//  Copyright © 2016 ebadaq.com. All rights reserved.
//

#import <UIKit/UIKit.h>

@class BusStopModel;
@class BusModel;
@class BookMarkModel;
@class StationData;
@class SearchViewController;

@interface AppDelegate : UIResponder <UIApplicationDelegate> {
    NSString *databaseName;
    NSString *databasePath;
    NSMutableArray *busDB;
    NSMutableArray *bus_stationDB;
    NSMutableArray *staion_timeDB;
}

@property (nonatomic, strong) BusStopModel *modelBusStop;
@property (nonatomic, strong) BusModel *modelBus;
@property (nonatomic, strong) BookMarkModel *modelBookMark;
@property (strong, nonatomic) IBOutlet UIWindow *window;

@property (nonatomic, strong) SearchViewController *searchView;
@property (nonatomic, strong) StationData *stationData;

//DB path
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *busDB;
@property (strong, nonatomic) NSMutableArray *bus_stationDB;
@property (strong, nonatomic) NSMutableArray *station_timeDB;

-(void)checkAndCreateDatabase;
-(NSMutableArray *)readDataFromDB: (char *)sql :(NSString *)tableName;

@end
























