//
//  StationData.m
//  Bus Story
//
//  Created by 김한철 on 2016. 7. 11..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "StationData.h"

@implementation StationData
@synthesize busNum, stationName, stationNum;

-(id) initWithData: (NSString *)b theStationName:(NSString *)s theStationNum:(NSString *)sN
{
    if(self = [super init]) {
        [self setBusNum:b];
        [self setStationName:s];
        [self setStationNum:sN];
    }
    return self;
}

@end

