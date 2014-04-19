//
//  LZTableViewController.m
//  ZengLab4_Code
//
//  Created by Li Zeng on 2/25/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZTableViewController.h"

@interface LZTableViewController ()

@end

@implementation LZTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    self.counter = 0;
    self.objects = [[NSMutableArray alloc] initWithArray:@[@"A", @"B", @"C", @"D"]];
    
    self.myTableView = [[UITableView alloc] initWithFrame:[[self view] bounds]];
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    
    [[self view] addSubview: self.myTableView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma tableView delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = [self.objects objectAtIndex: self.counter];
    self.counter += 1;
    return cell;
}


@end
