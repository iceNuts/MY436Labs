//
//  LZTabViewController.h
//  ZengLab4_Code
//
//  Created by Li Zeng on 2/25/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LZNormalViewController.h"
#import "LZTableViewController.h"
#import "LZNavViewController.h"
#import "LZFirstViewController.h"
#import "LZSecondViewController.h"

@interface LZTabViewController : UIViewController <UITabBarControllerDelegate, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITabBarController *tabController;

@property (nonatomic, strong) LZNormalViewController *normalController;
@property (nonatomic, strong) LZTableViewController * tableController;
@property (nonatomic, strong) LZNavViewController *navController;

@property (nonatomic, strong) LZFirstViewController *first;
@property (nonatomic, strong) LZSecondViewController *second;

@property (nonatomic, strong) NSMutableArray *objects;
@property (nonatomic) int counter;

@end
