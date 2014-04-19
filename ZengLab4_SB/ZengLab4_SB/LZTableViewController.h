//
//  LZTableViewController.h
//  ZengLab4_Code
//
//  Created by Li Zeng on 2/25/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LZTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *objects;
@property (nonatomic) int counter;
@property (strong, nonatomic) UITableView *myTableView;

@end
