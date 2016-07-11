//
//  BusStopModel.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BusStopModel.h"

@implementation BusStopModel



- (NSMutableArray *)busList{
    if (_busList == nil) {
        _busList = [@[] mutableCopy];
        
        [_busList addObject:@{@"busstopnum":@"000-01",@"busstopname":@"명지대역1",@"finishbusstop":@"강남역"}];
        [_busList addObject:@{@"busnum":@"5001",@"startbusstop":@"명지대1",@"finishbusstop":@"강남역", @"remainbusstop":@"1",@"bookmark":@"0"}];
        //버스번호, 기점정류소, 종점정류소, 남은정류소, 버스 즐겨찾기 여부
        [_busList addObject:@{@"busnum":@"5002",@"startbusstop":@"명지대1",@"finishbusstop":@"강남역", @"remainbusstop":@"2",@"bookmark":@"1"}];
        
        [_busList addObject:@{@"busnum":@"5003",@"startbusstop":@"명지대1",@"finishbusstop":@"강남역", @"remainbusstop":@"3",@"bookmark":@"1"}];
        
        [_busList addObject:@{@"busnum":@"5004",@"startbusstop":@"명지대1",@"finishbusstop":@"강남역", @"remainbusstop":@"4",@"bookmark":@"0"}];
        
    }
    return _busList;
}

@end
