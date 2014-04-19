//
//  LXMoveViewController.m
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LXMoveViewController.h"

@interface LXMoveViewController ()

@end

@implementation LXMoveViewController

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
    [_playerOneBtn setTitle: _btnOneText forState: UIControlStateNormal];
    [_playerTwoBtn setTitle: _btnTwoText forState: UIControlStateNormal];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    LXGameViewController *destViewController = segue.destinationViewController;
    if ([segue.identifier isEqualToString:@"playerOneSeg"]) {
        destViewController.computerPlayer = [_btnTwoText isEqualToString:@"Computer"];
        destViewController.whoFirst = @"one";
    } else if ([segue.identifier isEqualToString:@"playerTwoSeg"]) {
        destViewController.computerPlayer = [_btnTwoText isEqualToString:@"Computer"];
        destViewController.whoFirst = @"two";
    } else if ([segue.identifier isEqualToString:@"randomMoveSeg"]) {
        destViewController.computerPlayer = [_btnTwoText isEqualToString:@"Computer"];
        destViewController.whoFirst = @"random";
    }
}

@end
