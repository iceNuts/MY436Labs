//
//  LXViewController.m
//  ZENGLab1
//
//  Created by Li Zeng on 1/21/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LXViewController.h"

@interface LXViewController ()

@end

@implementation LXViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [_sampleImage setAlpha: 0.0];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)slidingValue:(id)sender {
    float aplhaValue = _imageAlphaSlider.value;
    [_sampleImage setAlpha: aplhaValue];
}


@end
