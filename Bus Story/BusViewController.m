//
//  BusViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BusViewController.h"
#import "BusStopModel.h" 
#import "BusModel.h" 

#import "BookMarkModel.h"
@interface BusViewController ()

@end

enum cellBusLine{
    BUSSTOPNAME=1,
    BUSSTOPNUM,
    BUSTIME,
    BUSSTOPSTARTANDFINISH=10
};

@implementation BusViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id app = [UIApplication sharedApplication];
    id appDelegate = [app delegate];
    self.modelBusStop = [appDelegate modelBusStop];
    self.modelBus = [appDelegate modelBus];

    
    
    self.modelBookMark = [appDelegate modelBookMark];//실제 값을 넣기전의 틀을 잡기 위해.
    
    [[self tableView] setRowHeight:80.0f];
    
    
    NSDictionary *dicInfo = self.modelBusStop.busList[self.modelBusStop.selectedIndex];
    self.title = dicInfo[@"busnum"];
    
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
    return self.modelBus.busLine.count+1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell;
    
    if(indexPath.row==0)
    {
        static NSString *CellIndetifier = @"CellBusInfo";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        
        UILabel *labelBusStopStartAndFinish = (UILabel *)[cell viewWithTag:BUSSTOPSTARTANDFINISH];
        
        
        [labelBusStopStartAndFinish setText:nil];
        
        
        NSDictionary *dicInfo = self.modelBusStop.busList[self.modelBusStop.selectedIndex];
        
        
        NSString *BusStopStartAndFinish = [[dicInfo[@"startbusstop"] stringByAppendingString:@" -> "] stringByAppendingString:dicInfo[@"finishbusstop"]];
        
        
        [labelBusStopStartAndFinish setText: BusStopStartAndFinish];
        
        
    }
    else
    {
        static NSString *CellIndetifier = @"CellBusLine";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        
        UILabel *labelBusStopName = (UILabel *)[cell viewWithTag:BUSSTOPNAME];
        UILabel *labelBusStopNum = (UILabel *)[cell viewWithTag:BUSSTOPNUM];
        UILabel *labelBusTime = (UILabel *)[cell viewWithTag:BUSTIME];
        
        
        [labelBusStopName setText:nil];
        [labelBusStopNum setText:nil];
        [labelBusTime setText:nil];
        
        
        NSDictionary *dicInfo = self.modelBus.busLine[indexPath.row-1];
        
        
        NSString *BusStopName = dicInfo[@"busstopname"];
        NSString *BusStopNum = dicInfo[@"busstopnum"];
        NSString *BusTime = [[dicInfo[@"firsttime"] stringByAppendingString:@" ~ "] stringByAppendingString:dicInfo[@"lasttime"]];
        
        
        
        [labelBusStopName setText:BusStopName];
        [labelBusStopNum setText:BusStopNum];
        [labelBusTime setText:BusTime];
        
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.modelBus.selectedBusStop = indexPath.row;
    
    NSDictionary *dicInfo = self.modelBus.busLine[self.modelBus.selectedBusStop];
    NSString *GOBusStopName = dicInfo[@"busstopname"];
    NSString *GOBusStopNum = dicInfo[@"busstopnum"];
    
    
    
    dicInfo = self.modelBusStop.busList[0];
    NSString *GIBusStopNum = dicInfo[@"busstopnum"];
    NSString *GIBusStopName = dicInfo[@"busstopname"];
    dicInfo = self.modelBusStop.busList[self.modelBusStop.selectedIndex];
    NSString *mBusNum = dicInfo[@"busnum"];

    if(true)
    {
        
        /*
        NSDictionary *dicInfo = self.modelBookMark.bookMark[lineNum];
        NSString *AlarmSet = dicInfo[@"alarmset"];
        NSString *GetInBusStopNum = dicInfo[@"getinbusstopnum"];
        NSString *GetInBusStopName = dicInfo[@"getinbusstopname"];
        NSString *GetOutBusStopNum = dicInfo[@"getoutbusstopnum"];
        NSString *GetOutBusStopName = dicInfo[@"getoutbusstopname"];
        NSString *BusStopLocation = dicInfo[@"busstoplocation"];
        NSString *BusNum = dicInfo[@"busnum"];
        NSString *RemainBusStop = dicInfo[@"remainbusstop"];
        NSString *RemainBusStop2 = dicInfo[@"remainbusstop2"];
        NSString *Accelerometer = dicInfo[@"accelerometer"];
        NSString *BusLocation = dicInfo[@"buslocation"];
        */
        /*
        NSString *GetInBusStopNum =@"000-5";
        NSString *GetInBusStopName =@"수원역";
        NSString *GetOutBusStopNum =@"001-5";
        NSString *GetOutBusStopName =@"기흥역";
         NSString *BusNum =@"10";
        */
        NSString *BusStopLocation =@"강남대역";
        
        NSString *RemainBusStop =@"3";
        NSString *RemainBusStop2 =@"5";
        NSString *Accelerometer =@"true";
        NSString *BusLocation =@"성균관대역";
        
        
        
        [self makePlist:GIBusStopNum  GetInBusStopName:GIBusStopName GetOutBusStopNum:GOBusStopNum GetOutBusStopName:GOBusStopName BusStopLocation:BusStopLocation BusNum:mBusNum RemainBusStop:RemainBusStop RemainBusStop2:RemainBusStop2 Accelerometer:Accelerometer BusLocation:BusLocation];
       
        [self loadPlist];
        [self makeNPlist];
        
        
    }
    
    
}





-(void)makePlist:(NSString *)mGetInBusStopNum
        GetInBusStopName:(NSString *)mGetInBusStopName
        GetOutBusStopNum:(NSString *)mGetOutBusStopNum
        GetOutBusStopName:(NSString *)mGetOutBusStopName
        BusStopLocation:(NSString *)mBusStopLocation
        BusNum:(NSString *)mBusNum
        RemainBusStop:(NSString *)mRemainBusStop
        RemainBusStop2:(NSString *)mRemainBusStop2
        Accelerometer:(NSString *)mAccelerometer
        BusLocation:(NSString *)mBusLocation
{
    
    //NSMakeRange(<#NSUInteger loc#>, <#NSUInteger len#>);
    bookMarkNum = self.modelBookMark.bookMark.count;
    for(lineNum=0;lineNum<=bookMarkNum;lineNum++)
    {
        
        NSString *AlarmSet=@"";
        NSString *GetInBusStopNum=@"";
        NSString *GetInBusStopName=@"";
        NSString *GetOutBusStopNum=@"";
        NSString *GetOutBusStopName=@"";
        NSString *BusStopLocation=@"";
        NSString *BusNum=@"";
        NSString *RemainBusStop=@"";
        NSString *RemainBusStop2=@"";
        NSString *Accelerometer=@"";
        NSString *BusLocation=@"";
        if(lineNum<bookMarkNum)
        {
            NSDictionary *dicInfo = self.modelBookMark.bookMark[lineNum];
            
           AlarmSet = dicInfo[@"alarmset"];
            
            GetInBusStopNum = dicInfo[@"getinbusstopnum"];
            GetInBusStopName = dicInfo[@"getinbusstopname"];
            GetOutBusStopNum = dicInfo[@"getoutbusstopnum"];
            GetOutBusStopName = dicInfo[@"getoutbusstopname"];
            BusStopLocation = dicInfo[@"busstoplocation"];
            BusNum = dicInfo[@"busnum"];
            RemainBusStop = dicInfo[@"remainbusstop"];
            RemainBusStop2 = dicInfo[@"remainbusstop2"];
            Accelerometer = dicInfo[@"accelerometer"];
            BusLocation = dicInfo[@"buslocation"];
        }
        
        
        
        
        NSString *a = [NSString stringWithFormat:@"%d", lineNum];
        
        NSDictionary *stringDic;
        if(lineNum==0)
        {
            stringDic = [[NSDictionary alloc] initWithObjectsAndKeys:AlarmSet, @"alarmset",nil];
        }
        else if(lineNum==bookMarkNum)
        {
            
            
            stringDic = [[NSDictionary alloc] initWithObjectsAndKeys:
                         mGetInBusStopNum, @"getinbusstopnum",
                         mGetInBusStopName,@"getinbusstopname",
                         mGetOutBusStopNum,@"getoutbusstopnum",
                         mGetOutBusStopName,@"getoutbusstopname",
                         mBusStopLocation,@"busstoplocation",
                         mBusNum,@"busnum",
                         mRemainBusStop,@"remainbusstop",
                         mRemainBusStop2,@"remainbusstop2",
                         mAccelerometer,@"accelerometer",
                         mBusLocation,@"buslocation",
                         nil];
           
        }
        else{
            stringDic = [[NSDictionary alloc] initWithObjectsAndKeys:
               GetInBusStopNum, @"getinbusstopnum",
                     GetInBusStopName,@"getinbusstopname",
                      GetOutBusStopNum,@"getoutbusstopnum",
                      GetOutBusStopName,@"getoutbusstopname",
                      BusStopLocation,@"busstoplocation",
                       BusNum,@"busnum",
                       RemainBusStop,@"remainbusstop",
                        RemainBusStop2,@"remainbusstop2",
                        Accelerometer,@"accelerometer",
                         BusLocation,@"buslocation",
                                       nil];
            
        }
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentRootPath = [documentPaths objectAtIndex:0];
        NSString *stringFilePath = [documentRootPath stringByAppendingFormat:@"/string%@.plist",a];

        BOOL isWritten=NO;
        isWritten= [stringDic writeToFile:stringFilePath atomically:YES];
        
        if(isWritten)
        {
            NSLog(@"ok");
        }
        else{
            NSLog(@"nob");
        }
    }
    numP=bookMarkNum+1;
}

-(void)makeNPlist{
    
        
        NSDictionary *stringDic = [[NSDictionary alloc] initWithObjectsAndKeys:[NSString stringWithFormat:@"%d",numP], @"num", nil];
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentRootPath = [documentPaths objectAtIndex:0];
        NSString *stringFilePath = [documentRootPath stringByAppendingFormat:@"/string.plist"];
        BOOL isWritten=NO;
        isWritten= [stringDic writeToFile:stringFilePath atomically:YES];
        
        if(isWritten)
        {
            NSLog(@"num ok");
        }
        else{
        NSLog(@"nob");
    }
    
}
- (void) loadPlist{
    self.modelBookMark.bookMark = [@[] mutableCopy];
    for(lineNum=0;lineNum<=bookMarkNum;lineNum++)
    {
        NSString *a = [NSString stringWithFormat:@"%d", lineNum];
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentRootPath =[documentPaths objectAtIndex:0];
        
        NSString *stringFilePath = [documentRootPath stringByAppendingFormat:@"/string%@.plist",a];
        NSDictionary *stringDic= [[NSDictionary alloc] initWithContentsOfFile:stringFilePath];
        
        
        if(stringDic){
            
            
            NSString *AlarmSet=@"";
            NSString *GetInBusStopNum=@"";
            NSString *GetInBusStopName=@"";
            NSString *GetOutBusStopNum=@"";
            NSString *GetOutBusStopName=@"";
            NSString *BusStopLocation=@"";
            NSString *BusNum=@"";
            NSString *RemainBusStop=@"";
            NSString *RemainBusStop2=@"";
            NSString *Accelerometer=@"";
            NSString *BusLocation=@"";
            if(lineNum==0)
            {
                AlarmSet = [stringDic objectForKey:@"alarmset"];
            }
            else
            {
                GetInBusStopNum = [stringDic objectForKey:@"getinbusstopnum"];
                GetInBusStopName = [stringDic objectForKey:@"getinbusstopname"];
                GetOutBusStopNum = [stringDic objectForKey:@"getoutbusstopnum"];
                GetOutBusStopName = [stringDic objectForKey:@"getoutbusstopname"];
                BusStopLocation = [stringDic objectForKey:@"busstoplocation"];
                BusNum = [stringDic objectForKey:@"busnum"];
                RemainBusStop = [stringDic objectForKey:@"remainbusstop"];
                RemainBusStop2 = [stringDic objectForKey:@"remainbusstop2"];
                Accelerometer = [stringDic objectForKey:@"accelerometer"];
                BusLocation = [stringDic objectForKey:@"buslocation"];
                
                
                
            }
            if(lineNum==0)
            {
                [self.modelBookMark.bookMark addObject:@{@"alarmset":AlarmSet}];
                
            }
            else
            {
                [self.modelBookMark.bookMark addObject:@{@"getinbusstopnum":GetInBusStopNum,
                                                         @"getinbusstopname":GetInBusStopName,
                                                         @"getoutbusstopnum":GetOutBusStopNum,
                                                         @"getoutbusstopname":GetOutBusStopName,
                                                         @"busstoplocation":BusStopLocation,
                                                         @"busnum": BusNum,
                                                         @"remainbusstop":RemainBusStop,
                                                         @"remainbusstop2":RemainBusStop2,
                                                         @"accelerometer":Accelerometer,
                                                         @"buslocation":BusLocation}];
            }
        }
        else{
            NSLog(@"시래");
        }
        
    }
}




/*
- (void) loadPlist{
    for(lineNum=0;lineNum<bookMarkNum;lineNum++)
    {
        NSString *a = [NSString stringWithFormat:@"%d", lineNum];
        NSArray *documentPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentRootPath =[documentPaths objectAtIndex:0];
        
        NSString *stringFilePath = [documentRootPath stringByAppendingFormat:@"/string%@.plist",a];
        NSDictionary *stringDic= [[NSDictionary alloc] initWithContentsOfFile:stringFilePath];
        
        
        
        if(stringDic){
        
            
            NSString *GetInBusStopNum = [stringDic objectForKey:@"getinbusstopnum"];
            NSString *GetInBusStopName = [stringDic objectForKey:@"getinbusstopname"];
            NSString *GetOutBusStopNum = [stringDic objectForKey:@"getoutbusstopnum"];
            NSString *GetOutBusStopName = [stringDic objectForKey:@"getoutbusstopname"];
            NSString *BusStopLocation = [stringDic objectForKey:@"busstoplocation"];
            NSString *BusNum = [stringDic objectForKey:@"busnum"];
            NSString *RemainBusStop = [stringDic objectForKey:@"remainbusstop"];
            NSString *RemainBusStop2 = [stringDic objectForKey:@"remainbusstop2"];
            NSString *Accelerometer = [stringDic objectForKey:@"accelerometer"];
            NSString *BusLocation = [stringDic objectForKey:@"buslocation"];
            
            
            NSLog(@"%@",a);
            NSLog(@"%@",GetInBusStopNum);
            
            
        }
        else{
            NSLog(@"시래");
        }
        
    }
}


*/




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
