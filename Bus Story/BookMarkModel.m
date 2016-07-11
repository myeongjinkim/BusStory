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
        [_bookMark addObject:@{@"getinbusstopnum":@"000-1",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstop":@"강남역1",@"finishbusstop":@"강남역",@"busnum":@"5001", @"remainbusstop":@"1"}];
        //탑승정류소번호, 탑승정류소이름, 하차정류소번호 하차정류소이름, 종점, 버스번호, 몇번째전
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-1",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstop":@"강남역1",@"finishbusstop":@"강남역",@"busnum":@"5002", @"remainbusstop":@"1"}];
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-1",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstop":@"강남역1",@"finishbusstop":@"강남역",@"busnum":@"5003", @"remainbusstop":@"1"}];
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-1",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstop":@"강남역1",@"finishbusstop":@"강남역",@"busnum":@"5004", @"remainbusstop":@"1"}];
       
    }
    return _bookMark;
}

@end
