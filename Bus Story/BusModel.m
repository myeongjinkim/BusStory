//
//  BusModel.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BusModel.h"

@implementation BusModel

- (NSMutableArray *)busLine{
    if (_busLine == nil) {
        _busLine = [@[] mutableCopy];
        
        
        
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-01",@"busstopname":@"명지대1",@"bustopsquence":@"1", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        //버스번호, 정류소번호, 정류소이름, 정류소순서, 첫차시간, 막차시간
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-02",@"busstopname":@"명지대2",@"bustopsquence":@"2", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-03",@"busstopname":@"명지대3",@"bustopsquence":@"3", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-04",@"busstopname":@"명지대4",@"bustopsquence":@"4", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-05",@"busstopname":@"명지대5",@"bustopsquence":@"5", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-06",@"busstopname":@"명지대6",@"bustopsquence":@"6", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-07",@"busstopname":@"강남역7",@"bustopsquence":@"7", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
    }
    return _busLine;
}

@end
