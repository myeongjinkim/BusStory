//
//  BookMarkViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BookMarkViewController.h"
#import "BookMarkModel.h"
#import "AlarmModel.h"
#import "AlarmController.h"

enum cellBusList{
    BUSSTOPNAME=1,
    FINISHBUSSTOP,
    BUSNUM,
    REMAINBUSSTOP,
    ALARMSWITCH
};

@interface BookMarkViewController ()

@end

@implementation BookMarkViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id app = [UIApplication sharedApplication];
    id appDelegate = [app delegate];
    self.modelBookMark = [appDelegate modelBookMark];
    self.modelAlarm = [appDelegate modelAlarm];
    self.alarmController = [[AlarmController alloc] init];

    [[self tableView] setRowHeight:100.0f];
    
    UILocalNotification *localNotif = [[UILocalNotification alloc]init];
    [[UIApplication sharedApplication] presentLocalNotificationNow:localNotif];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.modelBookMark.bookMark.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    
    UITableViewCell *cell;
    
    if(indexPath.row==0)
    {
        
        static NSString *CellIndetifier = @"CellSearchButton";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];

        
    }else
    {
        static NSString *CellIndetifier = @"CellBookMark";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        
        UILabel *labelBusStopName;
        UILabel *labelFinishBusStop;
        UILabel *labelBusNum;
        UILabel *labelRemainBusStop;
        UISwitch *AlarmSwitch;
        
        labelBusStopName = (UILabel *)[cell viewWithTag:BUSSTOPNAME];
        labelFinishBusStop = (UILabel *)[cell viewWithTag:FINISHBUSSTOP];
        labelBusNum = (UILabel *)[cell viewWithTag:BUSNUM];
        labelRemainBusStop = (UILabel *)[cell viewWithTag:REMAINBUSSTOP];
        AlarmSwitch = (UISwitch*)[cell viewWithTag:ALARMSWITCH];
        
        [labelBusStopName setText:nil];
        [labelFinishBusStop setText:nil];
        [labelRemainBusStop setText:nil];
        [labelBusNum setText:nil];
        
        
        NSDictionary *dicInfo = self.modelBookMark.bookMark[indexPath.row];//search button -1, set tablerow +1
        
        
        NSString *BusStopName = [[dicInfo[@"getinbusstopname"]stringByAppendingString:@" -> " ]stringByAppendingString:dicInfo[@"getoutbusstop"]];
        NSString *FinishBusStop = [dicInfo[@"busstoplocation"] stringByAppendingString:@"방면"];
        NSString *BusNum = dicInfo[@"busnum"];
        NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전"];
        
        
        
        [labelBusStopName setText:BusStopName];
        [labelFinishBusStop setText: FinishBusStop];
        [labelBusNum setText: BusNum];
        [labelRemainBusStop setText: RemainBusStop];
        [AlarmSwitch setOn:FALSE animated:YES];
        AlarmSwitch.tag=indexPath.row;
        [AlarmSwitch addTarget:self action:@selector(AlarmSwitchAnimate:) forControlEvents:UIControlEventValueChanged];
        
    }
    
    return cell;
}

-(void)AlarmSwitchAnimate:(id)sender
{
    UISwitch *AlarmSwitch=sender;
    if(AlarmSwitch.on){
        
        NSDictionary *dicInfo = self.modelBookMark.bookMark[0];
        NSString *AlarmSet = dicInfo[@"alarmset"];
        
        self.modelBookMark.selectedBookMark=AlarmSwitch.tag;
        
        dicInfo = self.modelBookMark.bookMark[AlarmSwitch.tag];
        NSString *BusNum = dicInfo[@"busnum"];
        NSString *GetInBusStopName = dicInfo[@"getinbusstopname"];
        NSString *GetOutBusStopName = dicInfo[@"getoutbusstop"];
        NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@" 출발"];

        
         [self.modelAlarm setAlarm:AlarmSet BusNum:BusNum GetInBusStopName:GetInBusStopName GetOutBusStopName:GetOutBusStopName RemainBusStop:RemainBusStop];
       
        
        [self alarmStart];
        
        //[self.alarmController alarmStart:self.modelAlarm.alarm];
        
        
    }
}

-(void)alarmStart{
    
    NSDictionary *dicInfo = self.modelAlarm.alarm[0];
    NSString *AlarmSet = dicInfo[@"alarmset"];
    NSString *BusNum = [dicInfo[@"busnum"] stringByAppendingString:@" 알람"];
    NSString *GetInBusStopName = [dicInfo[@"getinbusstopname"] stringByAppendingString:@" -> "];
    NSString *GetOutBusStopName = dicInfo[@"getoutbusstop"];
    NSString *GetInOut = [GetInBusStopName stringByAppendingString:GetOutBusStopName];
    NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전 출발"];
    
    NSLog(@" %@, %@, %@, %@, %@", AlarmSet, BusNum, GetInBusStopName, GetOutBusStopName, RemainBusStop);
    
    
    
    //알림창
    alert = [UIAlertController alertControllerWithTitle:BusNum message:GetInOut preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    //알림창자동닫기
    [NSTimer scheduledTimerWithTimeInterval:1.3f target:self selector:@selector(clearAlert:) userInfo:nil repeats:false];
    
    
    
    [self startLocalNotification];
    
}

-(void)clearAlert:(NSTimer*)timer{ // 알림자동닫기
    
    [alert dismissViewControllerAnimated:YES completion:nil];
}

-(void)startLocalNotification {
    NSLog(@"startLocalNotification");
    
    UILocalNotification *notification = [[UILocalNotification alloc] init];
    
    // 알람 발생 시각 설정. 5초후로 설정. NSDate 타입.
    notification.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    
    // timeZone 설정.
    notification.timeZone = [NSTimeZone systemTimeZone];
    
    // 알림 메시지 설정
    notification.alertBody = @"Just Do It";
    
    // 알림 액션 설정
    notification.alertAction = @"GOGO";
    
    // 아이콘 뱃지 넘버 설정. 임의로 1 입력
    notification.applicationIconBadgeNumber = 1;
    
    // 알림 사운드 설정. 자체 제작 사운드도 가능. (if nil = no sound)
    notification.soundName = UILocalNotificationDefaultSoundName;
    
    // 임의의 사용자 정보 설정. 알림 화면엔 나타나지 않음
    notification.userInfo = [NSDictionary dictionaryWithObject:@"My User Info" forKey:@"User Info"];
    
    // UIApplication을 이용하여 알림을 등록.

    
    [[UIApplication sharedApplication] scheduleLocalNotification:notification];
}





/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
