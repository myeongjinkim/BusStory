//
//  SearchViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

@synthesize mySearchBar, myTableView, initialCities, filteredCities, isFiltered;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //데이터 초기화
    
    initialCities = [[NSMutableArray alloc]initWithObjects:@"명지대", @"상공회의소", @"명지대사거리", @"용인등기소", @"역말마을", @"문화복지행정타운.용인대역", @"진우아파트",nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*** 검색 텍스트 자동완성부 ***/

//테이블 초기 셋팅(섹션 값)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//테이블 뷰 셋팅(행 갯수)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(isFiltered == YES){
        return filteredCities.count;
    }
    else{
        return 0;
    }
}

//테이블 뷰 셋팅(텍스트)
- (UITableViewCell *)tableView: (UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (isFiltered == YES) {
        cell.textLabel.text = [filteredCities objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = nil;
    }
    
    return cell;
}

//셀 선택 이벤트
#pragma mark - UITableView Delegate methods

- (void) tableView: (UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark - UISearchBarDelegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [mySearchBar reloadInputViews];
}

//일치 텍스트 찾기
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    
    if(searchText.length == 0) {
        isFiltered = NO;
    }
    else {
        isFiltered = YES;
        
        filteredCities = [[NSMutableArray alloc] init];
        
        for (NSString * cityName in initialCities){
            NSRange cityNameRange = [cityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (cityNameRange.location != NSNotFound){
                [filteredCities addObject:cityName];
            }
        }
    }
    
    //테이블 데이터 리셋
    [myTableView reloadData];
}

@end