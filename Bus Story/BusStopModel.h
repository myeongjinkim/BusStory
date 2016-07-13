//
//  BusStopModel.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SearchViewController.h"

@interface BusStopModel : NSObject

@property (nonatomic, assign) NSInteger selectedIndex;
@property (nonatomic, strong) NSMutableArray *busList;

@property (nonatomic, strong)SearchViewController *searchView;

@end
