//
//  BusModel.h
//  Bus Story
//
//  Created by Hyun Gyu Kim on 2016. 7. 8..
//  Copyright © 2016년 Hyun Gyu Kim. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BusModel : NSObject

@property (nonatomic, assign) NSInteger selectedBusStop;
@property (nonatomic, strong) NSMutableArray *busLine;

@end
