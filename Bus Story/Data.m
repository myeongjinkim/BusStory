//
//  Data.m
//  Bus Story
//
//  Created by 김한철 on 2016. 7. 13..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "Data.h"

@implementation Data

-(id) initWithData: (NSString *)b busstopname:(NSString *)s busstopnum:(NSString *)sN busstoplocation:(NSString *)dir startbusstop:(NSString *)sb endbusstop:(NSString *)eb firsttime:(NSString*)ft lasttime:(NSString*)lt;
{
    if(self = [super init]) {
        [self setBusNum:b];
        [self setStationName:s];
        [self setStationNum:sN];
        [self setDirection:dir];
        [self setStartStation:sb];
        [self setEndStation:eb];
        [self setStartTime:ft];
        [self setEndTime:lt];
    }
    return self;
}


@end
