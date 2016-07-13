//
//  BusStopModel.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BusStopModel.h"

@implementation BusStopModel


- (NSMutableArray *)busList {
    if (_busList == nil) {
        _busList = [@[] mutableCopy];
        
        /*
         busnum: busNum
         busstopName: stationName;
         startbusstop: startStation
         finishbusstop: endStation
         busstoplocation: nextStation
         remainbusstop: N/A
         busstopnum: stationNum
         
         */
        [_busList addObject:@{@"busstopnum":@"000-01",@"busstopname":@"명지대역1",@"busstoplocation":@"중간어딘가"}];
        
        //정류소번호, 정류소이름, 정류소 방면 전부 사용.
        
        [_busList addObject:@{@"busnum":@"5001",@"startbusstop":@"명지대기점",@"finishbusstop":@"강남대종점",@"busstoplocation":@"중간어딘가"}];
        //버스번호, 시작정류소, 종점정류소, 정류소방면, 남은정류소
        
        //버스번호, 시작정류소(시작), 종점정류소(끝), 정류소방면, 남은정류소 전부 사용
        
        [_busList addObject:@{@"busnum":@"5002",@"startbusstop":@"명지대기점",@"finishbusstop":@"강남대종점",@"busstoplocation":@"중간어딘가"}];
        
        [_busList addObject:@{@"busnum":@"5003",@"startbusstop":@"명지대기점",@"finishbusstop":@"강남대종점",@"busstoplocation":@"중간어딘가"}];
        
        [_busList addObject:@{@"busnum":@"5004",@"startbusstop":@"명지대기점",@"finishbusstop":@"강남대종점",@"busstoplocation":@"중간어딘가"}];
        
    }
    return _busList;
}

@end
