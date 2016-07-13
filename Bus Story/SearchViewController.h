//
//  SearchViewController.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface SearchViewController : UIViewController
<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate, UIPickerViewDelegate, UIPickerViewDataSource>
 

@property (weak, nonatomic) IBOutlet UISearchBar *mySearchBar;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic, strong) NSMutableArray * initialCities;
@property (nonatomic, strong) NSMutableArray * filteredCities;
@property BOOL isFiltered;

@property (nonatomic, strong) NSMutableArray * selectedArr;
@property (nonatomic, strong) NSMutableArray * filteredTable;

@property (nonatomic, strong) AppDelegate *mainDelegate;
@property NSArray* searchMode; // 피커에 넣어줄 데이터 소스를 담아줄 배열
@property IBOutlet UIPickerView *tweetPicker;
@property NSInteger isBusSearch;


@end
