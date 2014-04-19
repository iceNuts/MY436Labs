//
//  LZTabViewController.m
//  ZengLab4_Code
//
//  Created by Li Zeng on 2/25/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LZTabViewController.h"

@interface LZTabViewController ()

@end

@implementation LZTabViewController

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
    self.tabController = [[UITabBarController alloc] init];
    self.tabController.delegate = self;
    
    
    UITabBarItem *item0 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemDownloads tag:0];
    UITabBarItem *item1 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemContacts tag:1];
    UITabBarItem *item2 = [[UITabBarItem alloc] initWithTabBarSystemItem:UITabBarSystemItemHistory tag:2];
    
    self.normalController = [[LZNormalViewController alloc] init];
    self.tableController = [[LZTableViewController alloc] init];
    self.navController = [[LZNavViewController alloc] init];
    
    self.normalController.tabBarItem = item0;
    self.tableController.tabBarItem = item1;
    self.navController.tabBarItem = item2;
    
    self.counter = 0;
    self.objects = [[NSMutableArray alloc] initWithArray:@[@"A", @"B", @"C", @"D"]];
    
    self.tableController.tableView.delegate = self;
    self.tableController.tableView.dataSource = self;
    
    UILabel *textView = [[UILabel alloc] initWithFrame: CGRectMake(50, 50, 250, 50)];
    [textView setText: @"Lab4 Created by Li Zeng"];
    
    [[self.normalController view] addSubview: textView];
    
    self.first = [[LZFirstViewController alloc] init];
    self.second = [[LZSecondViewController alloc] init];
    
    self.first.title = @"First VC";
    self.second.title = @"Second VC";
    
    self.first.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle: @"*o*" style:UIBarButtonItemStylePlain target:nil action:nil];
    
    UIButton *pushBtn = [[UIButton alloc] initWithFrame: CGRectMake(130, 150, 60, 60)];
    [pushBtn addTarget:self action:@selector(pushViewController) forControlEvents:UIControlEventTouchUpInside];
    [pushBtn setTitle:@"push!" forState:UIControlStateNormal];
    [pushBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [[self.first view] addSubview: pushBtn];
    
    [self.navController pushViewController: self.first animated: YES];
    
    [self.tabController setViewControllers: [[NSArray alloc] initWithObjects: self.normalController, self.tableController, self.navController, nil]];
}

- (void)viewDidAppear:(BOOL)animated {
    [self presentViewController:self.tabController animated:NO completion: nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma navigationController method

-(void)pushViewController {
    UILabel *textView1 = [[UILabel alloc] initWithFrame: CGRectMake(80, 150, 250, 30)];
    [textView1 setText: @"PUSH SCREEN NOW"];
    [textView1 setTextColor:[UIColor blueColor]];
    [[self.second view] addSubview: textView1];
    [self.navController pushViewController:self.second animated: YES];
    
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
