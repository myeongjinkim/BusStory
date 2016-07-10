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

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) BusStopModel *modelBusStop;
@property (nonatomic, strong) BusModel *modelBus;
@property (nonatomic, strong) BookMarkModel *modelBookMark;
@property (strong, nonatomic) IBOutlet UIWindow *window;


@end























