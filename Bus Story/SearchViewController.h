//
//  SearchViewController.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>

@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray * initialCities;
@property (nonatomic, strong) NSMutableArray * filteredCities;
@property BOOL isFiltered;

@end
