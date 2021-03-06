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
        _bookMark = [[NSMutableArray alloc] init];
        
        [_bookMark addObject:@{@"alarmset":@"2"}];
        
        // 몇번쨰 전부터 알림인지 설정
        [_bookMark addObject:@{@"getinbusstopnum":@"000-1",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstopname":@"강남역1",@"busstoplocation":@"강남역",@"busnum":@"5001", @"remainbusstop":@"1", @"remainbusstop2":@"5", @"accelerometer":@"false", @"buslocation":@"명지대역1"}];
        //탑승정류소번호, 탑승정류소이름, 하차정류소번호 하차정류소이름, 정류소방면, 버스번호, 몇번째전, 몇번째전2, 가속도센서 여부, 버스위치
        //탑승정류소이름, 하차정류소이름, 정류소방면, 버스번호, 몇번쨰전 몇번째전2 가속도센서 여부 사용. 버스위치
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-2",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstopname":@"강남역1",@"busstoplocation":@"강남역",@"busnum":@"5002", @"remainbusstop":@"1", @"remainbusstop2":@"5", @"accelerometer":@"false", @"buslocation":@"명지대역2"}];
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-3",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstopname":@"강남역1",@"busstoplocation":@"강남역",@"busnum":@"5003", @"remainbusstop":@"1", @"remainbusstop2":@"5", @"accelerometer":@"true", @"buslocation":@"명지대역1"}];
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-4",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstopname":@"강남역1",@"busstoplocation":@"강남역",@"busnum":@"5004", @"remainbusstop":@"1", @"remainbusstop2":@"2", @"accelerometer":@"true", @"buslocation":@"명지대역1"}];
        
        [_bookMark addObject:@{@"getinbusstopnum":@"000-5",@"getinbusstopname":@"명지대역1",@"getoutbusstopnum":@"000-10",@"getoutbusstopname":@"강남역1",@"busstoplocation":@"강남역",@"busnum":@"5005", @"remainbusstop":@"1", @"remainbusstop2":@"2", @"accelerometer":@"true", @"buslocation":@"명지대역1"}];
        
        
       
    }
    return _bookMark;
}

@end
