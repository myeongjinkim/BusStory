//
//  BusViewController.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BusStopModel;
@class BusModel;
@class BookMarkModel;
@interface BusViewController : UITableViewController
{
    int lineNum;
    bool selected;
    int bookMarkNum;
    int numP;
    
}
@property (nonatomic, strong) BusStopModel *modelBusStop;
@property (nonatomic, strong) BusModel *modelBus;
@property (nonatomic,strong) BookMarkModel *modelBookMark;

@end
