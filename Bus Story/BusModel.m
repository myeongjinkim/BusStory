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
        
        
        
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-01",@"busstopname":@"명지대1",@"firsttime":@"04:00",@"lasttime":@"12:00"}];
        //버스번호, 정류소번호, 정류소이름, 첫차시간, 막차시간
        
        //버스번호, 정류소번호, 정류소이름, 첫차시간, 막차시간 사용
        
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-02",@"busstopname":@"명지대2",@"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-03",@"busstopname":@"명지대3", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-04",@"busstopname":@"명지대4", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-05",@"busstopname":@"명지대5", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-06",@"busstopname":@"명지대6", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
        [_busLine addObject:@{@"busnum":@"5000",@"busstopnum":@"000-07",@"busstopname":@"강남역7", @"firsttime":@"04:00",@"lasttime":@"12:00"}];
    }
    return _busLine;
}

@end
