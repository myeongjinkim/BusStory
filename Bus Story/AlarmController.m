//
//  AlarmController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 12..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "AlarmController.h"
#import "AlarmModel.h"
@implementation AlarmController

-(void) alarmStart: (NSMutableArray *)modelAlarmStart{
    
    NSDictionary *dicInfo = modelAlarmStart[0];
    NSString *BusNum = dicInfo[@"busnum"];
    NSString *GetInBusStopName = dicInfo[@"getinbusstopname"];
    NSString *GetOutBusStopName = dicInfo[@"getoutbusstop"];
    NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전 출발"];
    
    NSLog(@" %@, %@, %@, %@",BusNum, GetInBusStopName, GetOutBusStopName, RemainBusStop);
    
    

    
}
@end
