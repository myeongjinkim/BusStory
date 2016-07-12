//
//  AlarmViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 13..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "AlarmViewController.h"
#import "AlarmModel.h"

@interface AlarmViewController ()

@end

@implementation AlarmViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    id app = [UIApplication sharedApplication];
    id appDelegate = [app delegate];
    self.modelAlarm = [appDelegate modelAlarm];
    
    
    NSDictionary *dicInfo = self.modelAlarm.alarm[0];
    NSString *BusNum = dicInfo[@"busnum"];
    NSString *GetInBusStopName = dicInfo[@"getinbusstopname"];
    NSString *GetOutBusStopName = dicInfo[@"getoutbusstop"];
    NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전 출발"];
    
    NSLog(@" %@, %@, %@, %@",BusNum, GetInBusStopName, GetOutBusStopName, RemainBusStop);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
