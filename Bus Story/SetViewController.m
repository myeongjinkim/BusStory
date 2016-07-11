//
//  SetViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "SetViewController.h"

enum cellDeleteBusList{
    BUSSTOPNAME=1,
    FINISHBUSSTOP,
    BUSNUM,
    REMAINBUSSTOP
};
enum cellSet{
    SETBUSSTOP=10,
    SETBUSSTOPCOUNT,
};

@interface SetViewController ()

@end

@implementation SetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    id app = [UIApplication sharedApplication];
    id appDelegate = [app delegate];
    self.modelBookMark = [appDelegate modelBookMark];
    [[self tableView] setRowHeight:100.0f];
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
        
        static NSString *CellIndetifier = @"CellSet";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        
        UILabel *labelSetBusStop = (UILabel *)[cell viewWithTag:SETBUSSTOP];
        UIButton *setBusStopCount = (UIButton *)[cell viewWithTag:SETBUSSTOPCOUNT];
        
        [labelSetBusStop setText:nil];
        [setBusStopCount setTitle:nil forState:0];
        
        NSDictionary *dicInfo = self.modelBookMark.bookMark[0];
        
        NSString *SetBusStop = @"도착전 알림설정";
        NSString *SetBusStopCount = [dicInfo[@"alarmset"] stringByAppendingString:@"번째전"];

        
        [labelSetBusStop setText: SetBusStop];
        [setBusStopCount setTitle: SetBusStopCount forState:0];
        
    }else
    {
        static NSString *CellIndetifier = @"CellDeleteBookMark";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        
        UILabel *labelBusStopName = (UILabel *)[cell viewWithTag:BUSSTOPNAME];
        UILabel *labelFinishBusStop = (UILabel *)[cell viewWithTag:FINISHBUSSTOP];
        UILabel *labelBusNum = (UILabel *)[cell viewWithTag:BUSNUM];
        UILabel *labelRemainBusStop = (UILabel *)[cell viewWithTag:REMAINBUSSTOP];
        
        
        [labelBusStopName setText:nil];
        [labelFinishBusStop setText:nil];
        [labelRemainBusStop setText:nil];
        [labelBusNum setText:nil];
        
        
        NSDictionary *dicInfo = self.modelBookMark.bookMark[indexPath.row]; //set button -1, set tablerow +1
        
        
        NSString *BusStopName = [[dicInfo[@"busstopname"]stringByAppendingString:@" -> " ]stringByAppendingString:dicInfo[@"arrivebusstop"]];
        NSString *FinishBusStop = [dicInfo[@"finishbusstop"] stringByAppendingString:@"방면"];
        NSString *BusNum = dicInfo[@"busnum"];
        NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전"];
        
        
        
        [labelBusStopName setText:BusStopName];
        [labelFinishBusStop setText: FinishBusStop];
        [labelBusNum setText: BusNum];
        [labelRemainBusStop setText: RemainBusStop];
        
        
    }
    
    return cell;
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
