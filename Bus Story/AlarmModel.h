//
//  AlarmModel.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 12..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface AlarmModel : NSObject

@property (nonatomic, strong) NSMutableArray *alarm;
@property (nonatomic, assign) NSInteger selectedAlarm;
@property (nonatomic, assign) NSString* selectedRemain;

- (void)setAlarm:(NSString *)AlarmSet BusNum:(NSString *)BusNum GetInBusStopName:(NSString *)GetInBusStopName GetOutBusStopName:(NSString *)GetOutBusStopName RemainBusStop:(NSString *)RemainBusStop;
@end
