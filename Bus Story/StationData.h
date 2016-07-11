//
//  StationData.h
//  Bus Story
//
//  Created by 김한철 on 2016. 7. 11..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StationData : NSObject {
    
    NSString *busNum;
    NSString *stationName;
    NSString *stationNum;
    
}

@property(nonatomic, strong) NSString *busNum;
@property(nonatomic, strong) NSString *stationName;
@property (nonatomic, strong) NSString *stationNum;

-(id) initWithData: (NSString *)b theStationName:(NSString *)s theStationNum:(NSString *)sN;

@end
