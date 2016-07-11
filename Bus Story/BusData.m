//
//  BusData.m
//  Bus Story
//
//  Created by 김한철 on 2016. 7. 11..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BusData.h"

@implementation BusData
@synthesize busNum, startStation, endStation, startTime, lastTIme;

-(id) initWithData: (NSString *)b theStartStn:(NSString *)sS theEndStn:(NSString *)eS theStartTm: (NSString *)sT theLastTm: (NSString *)lT {
    if(self = [super init]) {
        [self setBusNum:b];
        [self setStartStation:sS];
        [self setEndStation:eS];
        [self setStartTime:sT];
        [self setLastTIme:lT];
    }
    return self;
}
@end
