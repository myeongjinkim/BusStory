//
//  Data.h
//  Bus Story
//
//  Created by 김한철 on 2016. 7. 13..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Data : NSObject

@property(nonatomic, strong) NSString *busNum;
@property(nonatomic, strong) NSString *stationName;
@property (nonatomic, strong) NSString *stationNum;
@property (nonatomic, strong) NSString *direction;
@property (nonatomic, strong) NSString *startStation;
@property (nonatomic, strong) NSString *endStation;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *endTime;

-(id) initWithData: (NSString *)b busstopname:(NSString *)s busstopnum:(NSString *)sN busstoplocation:(NSString *)dir startbusstop:(NSString *)sb endbusstop:(NSString *)eb firsttime:(NSString*)ft lasttime:(NSString*)lt;

@end
