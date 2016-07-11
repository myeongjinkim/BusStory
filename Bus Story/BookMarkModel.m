//
//  BookMarkModel.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BookMarkModel.h"

@implementation BookMarkModel

- (NSMutableArray *)bookMark{
    if (_bookMark == nil) {
        _bookMark = [@[] mutableCopy];
        
        [_bookMark addObject:@{@"alarmset":@"2"}];
        [_bookMark addObject:@{@"busStopnum":@"000-1",@"busstopname":@"명지대역1",@"arrivebusstop":@"강남역1전",@"finishbusstop":@"강남역",@"busnum":@"5000", @"remainbusstop":@"1"}];
        //버스번호, 정류소번호, 정류소이름, 정류소순서, 첫차시간, 막차시간
        
        [_bookMark addObject:@{@"busStopnum":@"000-2",@"busstopname":@"명지대역2",@"arrivebusstop":@"강남역2전",@"finishbusstop":@"강남역",@"busnum":@"5000", @"remainbusstop":@"1"}];
        
        [_bookMark addObject:@{@"busStopnum":@"000-3",@"busstopname":@"명지대역3",@"arrivebusstop":@"강남역3전",@"finishbusstop":@"강남역",@"busnum":@"5000", @"remainbusstop":@"1"}];
        
        [_bookMark addObject:@{@"busStopnum":@"000-4",@"busstopname":@"명지대역4",@"arrivebusstop":@"강남역4전",@"finishbusstop":@"강남역",@"busnum":@"5000", @"remainbusstop":@"1"}];
       
    }
    return _bookMark;
}

@end
