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
        
        
        NSDictionary *dicInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"5000",@"busnum",@"명지대",@"startbusstop",@"강남역",@"finishbusstop",@"1",@"remainbusstop",nil];
        [_busList addObject:dicInfo];
        
        dicInfo = [NSDictionary dictionaryWithObjectsAndKeys:@"5001",@"busnum",@"명지대",@"startbusstop",@"강남역",@"finishbusstop",@"1",@"remainbusstop",nil];
        [_busList addObject:dicInfo];
        
        [_busList addObject:@{@"busnum":@"5002",@"startbusstop":@"명지대",@"finishbusstop":@"강남역", @"remainbusstop":@"1"}];
                                  //[NSNumber numberWithInt:self.remainbusstop], @"busbookmarkswitch":[NSNumber numberWithBool:true ] }];//버스번호, 기점정류소, 종점정류소, 남은정류소, 버스 즐겨찾기 여부
        [_busList addObject:@{@"busnum":@"5003",@"startbusstop":@"명지대",@"finishbusstop":@"강남역", @"remainbusstop":@"1"}];
                              //[NSNumber numberWithInt:self.remainbusstop], @"busbookmarkswitch":[NSNumber numberWithBool:true ] }];
    }
    return _busList;
}

@end
