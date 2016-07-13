//
//  BookMarkViewController.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BookMarkModel.h"
#import "AlarmModel.h"
#import "AlarmController.h"

@interface BookMarkViewController : UITableViewController{
    UIAlertController* alert;
    NSMutableArray *AlarmArray;
    Boolean IsAlarm;
    NSTimer *myTimerStart;
}

@property (nonatomic, strong) BookMarkModel *modelBookMark;
@property (nonatomic, strong) AlarmModel *modelAlarm;
@property (nonatomic, strong) AlarmController *alarmController;
@end
