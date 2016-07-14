//
//  AlarmModel.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 12..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "AlarmModel.h"
@implementation AlarmModel

- (void)setAlarm:(NSString *)AlarmSet BusNum:(NSString *)BusNum GetInBusStopName:(NSString *)GetInBusStopName GetOutBusStopName:(NSString *)GetOutBusStopName RemainBusStop:(NSString *)RemainBusStop{
    
    _alarm = [@[] mutableCopy];
    
    [_alarm addObject:@{@"alarmset":AlarmSet,@"busnum":BusNum,@"getinbusstopname":GetInBusStopName,@"getoutbusstopname":GetOutBusStopName, @"remainbusstop":RemainBusStop}];
    
}

@end
