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
    AlarmArray = [@[] mutableCopy];
    [[self tableView] setRowHeight:100.0f];
    IsAlarm=false;
    boolAlarm = false;
    
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
        //UISwitch *AlarmSwitch;
        
        labelBusStopName = (UILabel *)[cell viewWithTag:BUSSTOPNAME];
        labelFinishBusStop = (UILabel *)[cell viewWithTag:FINISHBUSSTOP];
        labelBusNum = (UILabel *)[cell viewWithTag:BUSNUM];
        labelRemainBusStop = (UILabel *)[cell viewWithTag:REMAINBUSSTOP];
      AlarmButton = (UIButton*)[cell viewWithTag:ALARMSWITCH];
        
        
        [labelBusStopName setText:nil];
        [labelFinishBusStop setText:nil];
        [labelRemainBusStop setText:nil];
        [labelBusNum setText:nil];
        
        
        NSDictionary *dicInfo = self.modelBookMark.bookMark[indexPath.row];//search button -1, set tablerow +1
        self.modelAlarm.selectedAlarm=indexPath.row;
        
        NSString *BusStopName = [[dicInfo[@"getinbusstopname"]stringByAppendingString:@" -> " ]stringByAppendingString:dicInfo[@"getoutbusstop"]];
        NSString *FinishBusStop = [dicInfo[@"busstoplocation"] stringByAppendingString:@"방면"];
        NSString *BusNum = dicInfo[@"busnum"];
        NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전"];
        
        
        [labelBusStopName setText:BusStopName];
        [labelFinishBusStop setText: FinishBusStop];
        [labelBusNum setText: BusNum];
        [labelRemainBusStop setText: RemainBusStop];
        
        
        
        
        
        [AlarmButton addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        [self.view addSubview:AlarmButton];
    
        
        
        
        AlarmButton.tag = indexPath.row-1;
        AlarmButton.frame= CGRectMake(230, 25+(indexPath.row)*100, 50, 50);
        UIImage * buttonImage = [UIImage imageNamed:@"AlarmOff.jpeg"];
        
        [AlarmButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        
        
        [AlarmArray addObject:@{@"bool":@"false"}];
        
    }
    
    return cell;
}

-(void)buttonClicked:(id)sender
{
    AlarmButton = sender;
    
    NSDictionary *dicInfo = AlarmArray[AlarmButton.tag];
    NSString *Bool = dicInfo[@"bool"];
    
    NSLog(@"%@", Bool);
    
    
    if([Bool isEqualToString:@"false" ] && IsAlarm==false)
    {
        UIImage *buttonImage = [UIImage imageNamed:@"AlarmOn.jpeg"];
        [AlarmButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        
        NSLog(@"눌림?");
        NSMutableArray *fake;
        fake = [AlarmArray mutableCopy];
        AlarmArray = [@[] mutableCopy];
        
        for(int num=0;self.modelAlarm.selectedAlarm>num;num++)
        {
            
            if(num==AlarmButton.tag)
            {
                [AlarmArray addObject:@{ @"bool": @"true"}];
            }
            else{
                NSDictionary *alarmInfo = fake[num];
                NSString *Bool = alarmInfo[@"bool"];
                [AlarmArray addObject:@{ @"bool": Bool}];
            }
        }
        
        IsAlarm=true;
        self.modelBookMark.selectedBookMark = AlarmButton.tag+1;
        [self alarmStart];
        
    
    }
    else if([Bool isEqualToString:@"true" ] && IsAlarm==true){
        
        UIImage *buttonImage = [UIImage imageNamed:@"AlarmOff.jpeg"];
        [AlarmButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
        NSLog(@"때짐?");
        
        NSMutableArray *fake;
        fake = [AlarmArray mutableCopy];
        AlarmArray = [@[] mutableCopy];
        
        for(int num=0;self.modelAlarm.selectedAlarm>num;num++)
        {
            
            if(num==AlarmButton.tag)
            {
                [AlarmArray addObject:@{ @"bool": @"false"}];
            }
            else{
                NSDictionary *alarmInfo = fake[num];
                NSString *Bool = alarmInfo[@"bool"];
                [AlarmArray addObject:@{ @"bool": Bool}];
            }
        }
        IsAlarm=false;
        [self alarmClose];
        
    }
    else if([Bool isEqualToString:@"false" ] && IsAlarm==true)
    {
        
        NSString *msg = @"이미 다른버스 알림을 받고 계십니다.";
        [self AlertAlarm:msg Message:nil];
    }
}


-(void)alarmStart{
    
    NSDictionary *bookMarkInfo = self.modelBookMark.bookMark[0];
    NSString *BAlarmSet = bookMarkInfo[@"alarmset"];
    
    bookMarkInfo = self.modelBookMark.bookMark[self.modelBookMark.selectedBookMark];
    NSString *BBusNum = bookMarkInfo[@"busnum"];
    NSString *BGetInBusStopName = bookMarkInfo[@"getinbusstopname"];
    NSString *BGetOutBusStopName = bookMarkInfo[@"getoutbusstop"];
    NSString *BRemainBusStop = bookMarkInfo[@"remainbusstop"];
    boolalart=true;
    
    [self.modelAlarm setAlarm:BAlarmSet BusNum:BBusNum GetInBusStopName:BGetInBusStopName GetOutBusStopName:BGetOutBusStopName RemainBusStop:BRemainBusStop];
    
    NSDictionary *dicInfo = self.modelAlarm.alarm[0];
    NSString *AlarmSet = dicInfo[@"alarmset"];
    NSString *BusNum = dicInfo[@"busnum"];
    NSString *GetInBusStopName = [dicInfo[@"getinbusstopname"] stringByAppendingString:@" -> "];
    NSString *GetOutBusStopName = dicInfo[@"getoutbusstop"];
    NSString *GetInOut = [GetInBusStopName stringByAppendingString:GetOutBusStopName];
    NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전"];
    NSString *BusNumMsg = [BusNum stringByAppendingString:@" 알람"];
    NSString *msg = [[BusNum stringByAppendingString:@"번 " ] stringByAppendingString:RemainBusStop];
    
    
    self.modelAlarm.selectedRemain=dicInfo[@"remainbusstop"];
    
    //alert
    [self AlertAlarm:BusNumMsg Message:GetInOut];
    
    
    //local notification start
    UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
    UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
    [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    
    UILocalNotification* localNotification = [[UILocalNotification alloc]init];
    localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
    
    localNotification.alertBody = msg;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
    localNotification.repeatInterval = NSCalendarUnitMinute;
    
    localNotification.soundName = UILocalNotificationDefaultSoundName;
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
    
     myTimerStart = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(LocalNoti) userInfo:nil repeats:true];
    
}


-(void)alarmFinish{
    
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
}

-(void)alarmClose{
    NSDictionary *dicInfo = self.modelAlarm.alarm[0];
    NSString *BusNum = dicInfo[@"busnum"];
    NSString *msg =  @" 알람을 종료합니다.";
    [self AlertAlarm:BusNum Message:msg];
    
    //local notification close
    [self alarmFinish];
    
    [myTimerStart invalidate];
    myTimerStart = nil;
}

-(void)AlertAlarm:(NSString *)Title Message:(NSString *)Message
{
    
    //알림창
    alert = [UIAlertController alertControllerWithTitle:Title message:Message preferredStyle:UIAlertControllerStyleAlert];
    [self presentViewController:alert animated:YES completion:nil];
    
    
    //알림창자동닫기
    [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(clearAlert:) userInfo:nil repeats:false];
}

-(void)clearAlert:(NSTimer*)timer{ // 알림자동닫기
    
    [alert dismissViewControllerAnimated:YES completion:nil];
    alert=nil;
}


-(void)LocalNoti
{
    NSDictionary *bookMarkInfo = self.modelBookMark.bookMark[0];
    NSString *BAlarmSet = bookMarkInfo[@"alarmset"];
    
    bookMarkInfo = self.modelBookMark.bookMark[self.modelBookMark.selectedBookMark];
    NSString *BBusNum = bookMarkInfo[@"busnum"];
    NSString *BGetInBusStopName = bookMarkInfo[@"getinbusstopname"];
    NSString *BGetOutBusStopName = bookMarkInfo[@"getoutbusstop"];
    NSString *BRemainBusStop = bookMarkInfo[@"remainbusstop"];
    NSString *BRemainBusStop2 = bookMarkInfo[@"remainbusstop2"];
     NSString *Accelerometer = bookMarkInfo[@"accelerometer"];
     NSString *BusLoation = bookMarkInfo[@"buslocation"];
    
    [self.modelAlarm setAlarm:BAlarmSet BusNum:BBusNum GetInBusStopName:BGetInBusStopName GetOutBusStopName:BGetOutBusStopName RemainBusStop:BRemainBusStop];
    
    NSDictionary *dicInfo = self.modelAlarm.alarm[0];
    NSString *AlarmSet = dicInfo[@"alarmset"];
    NSString *BusNum = dicInfo[@"busnum"];
    //NSString *GetInBusStopName = [dicInfo[@"getinbusstopname"] stringByAppendingString:@" -> "];
    //NSString *GetOutBusStopName = dicInfo[@"getoutbusstop"];
    //NSString *GetInOut = [GetInBusStopName stringByAppendingString:GetOutBusStopName];
    NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전"];
    
    NSString *RemainBusStop2 = [BRemainBusStop2 stringByAppendingString:@"번째전"];
    
    NSString *Remain = dicInfo[@"remainbusstop"];
    //NSString *BusNumMsg = [BusNum stringByAppendingString:@" 알람"];
    NSString *msg = [[BusNum stringByAppendingString:@"번 " ] stringByAppendingString:RemainBusStop];
    NSString *AlamMsg= @"";
    
    if([BGetInBusStopName isEqualToString:BusLoation] && [Accelerometer isEqualToString:@"false"])
    {
        //다시 승차알림
        NSLog(@"버스지나감");
        
        if(boolalart==true){
            AlamMsg=@"버스를 놓치셨습니다. 다음 버스를 알람해 드립니다.";
            boolalart=false;
            
        }
        
        
    }
    else if([BGetInBusStopName isEqualToString:BusLoation] && [Accelerometer isEqualToString:@"true"])
    {
        //하차알림
        NSLog(@"버스탐.");
        Boolean alarmMode = true;
        if(boolalart==true&& alarmMode==true){
        
            AlamMsg =  @"승차하셨습니다. 하차 알람을 시작합니다.";
           boolalart=false;
            alarmMode=false;
            
        }
        
        msg = [[BusNum stringByAppendingString:@"번 하차 " ] stringByAppendingString:RemainBusStop2];
        
        int NAlarmSet = [AlarmSet intValue];
        int NRemainBusStop2 = [BRemainBusStop2 intValue];
        if(NAlarmSet==NRemainBusStop2)
        {
            NSLog(@"소리 ㄱ");
            
            if(alarmMode==false){
                AlamMsg = @"목적지에 근접하였습니다. 알림을 종료합니다.";
                alarmMode=true;
            }
            NSMutableArray *fake;
            fake = [AlarmArray mutableCopy];
            AlarmArray = [@[] mutableCopy];
            
            for(int num=0;self.modelAlarm.selectedAlarm>num;num++)
            {
                
                if(num==AlarmButton.tag)
                {
                    [AlarmArray addObject:@{ @"bool": @"false"}];
                }
                else{
                    NSDictionary *alarmInfo = fake[num];
                    NSString *Bool = alarmInfo[@"bool"];
                    [AlarmArray addObject:@{ @"bool": Bool}];
                }
            }
            IsAlarm=false;
            [myTimerStart invalidate];
            myTimerStart = nil;
            UIImage *buttonImage = [UIImage imageNamed:@"AlarmOff.jpeg"];
            [AlarmButton setBackgroundImage:buttonImage forState:UIControlStateNormal];
            
        }
    }
    if([AlamMsg isEqualToString:@""]==false)
    {
        [alert dismissViewControllerAnimated:YES completion:nil];
        [self AlertAlarm:BusNum Message:AlamMsg];
    }
    

    if([self.modelAlarm.selectedRemain isEqualToString: Remain]==true) // false 여야함.
    {
    
        [self alarmFinish];
        
    
        UIUserNotificationType types = UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert;
        UIUserNotificationSettings *mySettings = [UIUserNotificationSettings settingsForTypes:types categories:nil];
        [[UIApplication sharedApplication] registerUserNotificationSettings:mySettings];
    
    
        UILocalNotification* localNotification = [[UILocalNotification alloc]init];
        localNotification.fireDate = [NSDate dateWithTimeIntervalSinceNow:0];
        NSLog(@"%@",msg);
        localNotification.alertBody = msg;
        localNotification.timeZone = [NSTimeZone defaultTimeZone];
        localNotification.repeatInterval = NSCalendarUnitMinute;
    
        localNotification.soundName = UILocalNotificationDefaultSoundName;
        [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
    
        NSLog(@"생성");
    
        if(boolAlarm==true)
        {
        
            self.modelAlarm.selectedRemain=dicInfo[@"remainbusstop"];
    
        }
        boolAlarm=true;
    }
    else{
        boolAlarm=false;
    }
    

    
    
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
