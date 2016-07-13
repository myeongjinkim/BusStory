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
@class AlarmModel;

@class StationData;
@class SearchViewController;
@class BusData;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) BusStopModel *modelBusStop;
@property (nonatomic, strong) BusModel *modelBus;
@property (nonatomic, strong) BookMarkModel *modelBookMark;
@property (strong, nonatomic) IBOutlet UIWindow *window;
@property (nonatomic, strong) AlarmModel *modelAlarm;

@property (nonatomic, strong) SearchViewController *searchView;

//DB path
@property (strong, nonatomic) NSString *databaseName;
@property (strong, nonatomic) NSString *databasePath;
@property (strong, nonatomic) NSMutableArray *busDB;

-(void)checkAndCreateDatabase;
-(NSMutableArray *)readDataFromDB:(char*)sql;

@end
























