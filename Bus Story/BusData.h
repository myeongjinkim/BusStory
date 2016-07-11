//
//  BusData.h
//  Bus Story
//
//  Created by 김한철 on 2016. 7. 11..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusData : NSObject {
    NSString *busNum;
    NSString *startStation;
    NSString *endStation;
    NSString *startTime;
    NSString *lastTime;
}

@property(nonatomic, strong) NSString *busNum;
@property(nonatomic, strong) NSString *startStation;
@property(nonatomic, strong) NSString *endStation;
@property(nonatomic, strong) NSString *startTime;
@property(nonatomic, strong) NSString *lastTIme;

-(id) initWithData: (NSString *)b theStartStn:(NSString *)sS theEndStn:(NSString *)eS theStartTm: (NSString *)sT theLastTm: (NSString *)lT;


@end
