//
//  LXStartViewController.m
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LXStartViewController.h"

@interface LXStartViewController ()

@end

@implementation LXStartViewController

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
    _viewTitle.enabled = false;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LXMoveViewController *destViewController = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"onePlayerSeg"]) {
        destViewController.btnOneText = @"Player 1";
        destViewController.btnTwoText = @"Computer";
    } else if ([segue.identifier isEqualToString:@"twoPlayerSeg"]) {
        destViewController.btnOneText = @"Player 1";
        destViewController.btnTwoText = @"Player 2";
    }
}

@end
