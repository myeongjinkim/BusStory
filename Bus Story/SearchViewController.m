//
//  SearchViewController.m
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import "SearchViewController.h"
#import "Data.h"
#import "BusViewController.h"
#import "BusStopViewController.h"
@interface SearchViewController ()

@end

@implementation SearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _isBusSearch = 1;
    
    _mainDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];

    _selectedArr = [[NSMutableArray alloc]init];
    
    _searchMode = [[NSArray alloc] initWithObjects:@"버스번호",@"정류소명",@"정류소번호",nil];
    
    Data *data;
    int j = 0;
    
    for (int i = 0; i < _mainDelegate.busDB.count; ++i) {
        data = [_mainDelegate.busDB objectAtIndex:i ];

        if(![_selectedArr containsObject: data.busNum]){
            [_selectedArr insertObject: data.busNum atIndex:j];
            j++;
        }
    }
    
    _initialCities = [[NSMutableArray alloc]initWithArray:_selectedArr];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// 피커를 사용하기 위해 반드시 사용되어야 할 필수 메소드이다.
- (NSInteger)pickerView:(UIPickerView *) pickerView numberOfRowsInComponent : (NSInteger)component{
    return 3;
}

// 피커를 사용하기 위해 반드시 사용되어야 할 필수 델리게이트이다.
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow: (NSInteger)row forComponent: (NSInteger)component{
    
    switch (component) {
        case 0:
            return [_searchMode objectAtIndex:row]; //0번째 컴퍼넌트의 선택된 문자열을 반환한다.
            
        case 1:
            return [_searchMode objectAtIndex:row]; //1번째 컴퍼넌트의 선택된 문자열을 반환한다.
    }
    return nil;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    Data *data;
    NSString *str =  [_searchMode objectAtIndex:row];
    [_selectedArr removeAllObjects];
    
    NSLog(@"%d", _mainDelegate.busDB.count);
    int j = 0, k = 0, l = 0;
            for (int i = 0; i < _mainDelegate.busDB.count; i++) {
        
                data = [_mainDelegate.busDB objectAtIndex:i ];
//                NSLog(@"%@", data.busNum);
                if([str isEqualToString:@"버스번호"]) {
                    _isBusSearch = 1;
                    if(![_selectedArr containsObject: data.busNum]){
                        [_selectedArr insertObject: data.busNum atIndex:j];
                        j++;
                    }
                }else if([str isEqualToString:@"정류소명"]){
                    _isBusSearch = 2;
                    if(![_selectedArr containsObject: data.stationName]) {
                        [_selectedArr insertObject: data.stationName atIndex:k];
                        k++;
                    }
                }else {
                    _isBusSearch = 3;
                    if(![_selectedArr containsObject: data.stationNum]) {
                        [_selectedArr insertObject: data.stationNum atIndex:l];
                        l++;
                    }
                }
            }
    _initialCities = [[NSMutableArray alloc]initWithArray:_selectedArr];
   
}

/*** 검색 텍스트 자동완성부 ***/

//테이블 초기 셋팅(섹션 값)
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

//테이블 뷰 셋팅(행 갯수)
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if(_isFiltered == YES){
        return self.filteredCities.count;
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
    
    if (_isFiltered == YES) {
        cell.textLabel.text = [_filteredCities objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = nil;
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

//셀 선택 이벤트
#pragma mark - UITableView Delegate methods

- (void) tableView: (UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 셀 선택 시 새로운 쿼리execute, 값 넘기기(버스번호, 정류소명, 정류소번호, 방면, 첫차시간, 막차시간)
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *selectedText = cell.textLabel.text;
    NSString *concat = [NSString stringWithFormat:@"%s%@%s%@%s%@%s", "select * from bus_stationInfo where stationName='",selectedText,"' or stationNum='",selectedText,"' or busNum='",selectedText,"'"];
    char sql = [concat characterAtIndex:0];
    
    
//넘길 mutableArr 생성
    [_mainDelegate checkAndCreateDatabase];
    self.filteredTable = [_mainDelegate readDataFromDB: &sql];
    
    /***    입력구문 select테스트     ***/
//    Data *data;
//    NSString *appendedData;
//    NSMutableArray *arr = [[NSMutableArray alloc]init];
//    for (int i = 0; i < _filteredTable.count; i++) {
//        
//        data = [_filteredTable objectAtIndex:i ];
//        [arr insertObject: data.busNum  atIndex:i];
//    }
//    
//    for (id buses in arr) {
//        NSLog(@"%@", buses);
//    }
    
    BusStopViewController *vc = [[BusStopViewController alloc] initWithNibName:@"BusStopViewController" bundle:nil];
    [self.navigationController pushViewController:vc  animated:TRUE];

}

#pragma mark - UISearchBarDelegate Methods

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [_mySearchBar reloadInputViews];
}

//일치 텍스트 찾기
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
       if(searchText.length == 0) {
        _isFiltered = NO;
    }
    else {
        _isFiltered = YES;
        
        _filteredCities = [[NSMutableArray alloc] init];
        
        for (NSString * cityName in _initialCities){
            NSRange cityNameRange = [cityName rangeOfString:searchText options:NSCaseInsensitiveSearch];
            
            if (cityNameRange.location != NSNotFound) {
                [_filteredCities addObject:cityName];
            }
        }
    }
    
    //테이블 데이터 리셋
    [[self myTableView] reloadData];
}


@end