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
