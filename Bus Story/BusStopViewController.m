//
//  BusStopViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "BusStopViewController.h"
#import "BusStopModel.h"

enum cellBusStop{
    BUSSTOPNUM=10,
    BUSSTOPFINISH
};
enum cellBusList{
    BUSNUM=1,
    FINISHBUSSTOP,
    REMAINBUSSTOP
};

@interface BusStopViewController ()

@end

@implementation BusStopViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    id app = [UIApplication sharedApplication];
    id appDelegate = [app delegate];
    self.modelBusStop = [appDelegate modelBusStop];
    [[self tableView] setRowHeight:100.0f];
    
    NSDictionary *dicInfo = self.modelBusStop.busList[0];
    self.title = dicInfo[@"busstopname"];
    
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
//#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
//#warning Incomplete implementation, return the number of rows
    return self.modelBusStop.busList.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
 
    
    
    UITableViewCell *cell;
    
    if(indexPath.row==0)
    {
        static NSString *CellIndetifier = @"CellBusStop";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        
        UILabel *labelBusStopNum = (UILabel *)[cell viewWithTag:BUSSTOPNUM];
        UILabel *labelFinishBusStop = (UILabel *)[cell viewWithTag:BUSSTOPFINISH];

        
        [labelBusStopNum setText:nil];
        [labelFinishBusStop setText:nil];
        
        
        NSDictionary *dicInfo = self.modelBusStop.busList[indexPath.row];
        
        
        NSString *BusStopNum = dicInfo[@"busstopnum"];
        NSString *FinishBusStop = [dicInfo[@"finishbusstop"] stringByAppendingString:@"방면"];
        
        
        
        [labelBusStopNum setText: BusStopNum];
        [labelFinishBusStop setText: FinishBusStop];
        
        
    }
    else
    {
        static NSString *CellIndetifier = @"CellBus";
        cell = [tableView dequeueReusableCellWithIdentifier:CellIndetifier forIndexPath:indexPath];
        UILabel *labelBusNum = (UILabel *)[cell viewWithTag:BUSNUM];
        UILabel *labelFinishBusStop = (UILabel *)[cell viewWithTag:FINISHBUSSTOP];
        UILabel *labelRemainBusStop = (UILabel *)[cell viewWithTag:REMAINBUSSTOP];
    
        
        [labelBusNum setText:nil];
        [labelFinishBusStop setText:nil];
        [labelRemainBusStop setText:nil];
    
    
        NSDictionary *dicInfo = self.modelBusStop.busList[indexPath.row];
    
    
        NSString *BusNum = dicInfo[@"busnum"];
        NSString *FinishBusStop = [dicInfo[@"finishbusstop"] stringByAppendingString:@"방면"];
        NSString *RemainBusStop = [dicInfo[@"remainbusstop"] stringByAppendingString:@"번째전"];
    

    
        [labelBusNum setText: BusNum];
        [labelFinishBusStop setText: FinishBusStop];
        [labelRemainBusStop setText: RemainBusStop];
    }
    
    return cell;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.modelBusStop.selectedIndex = indexPath.row;
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
