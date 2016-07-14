//
//  SetViewController.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookMarkModel.h"
#import "BusStopModel.h"
@interface SetViewController : UITableViewController

@property (nonatomic, strong) BookMarkModel *modelBookMark;
@property (nonatomic, strong) BusStopModel *modelBusStop;
@end
