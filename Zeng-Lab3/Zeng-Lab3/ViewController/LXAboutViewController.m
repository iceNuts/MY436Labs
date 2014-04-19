//
//  LXAboutViewController.m
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LXAboutViewController.h"

@interface LXAboutViewController ()

@end

@implementation LXAboutViewController

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
    _loadText =
            @"<html> \
            <body> \
            <h3>Tic-Tac-Toe Game</h> \
            <br/>            \
            <p>Developed By Li Zeng 433519 @ WUSTL CS</p> \
            <br/> \
            <p>For More Information About this game: http://en.wikipedia.org/wiki/Tic_tac_toe </p> \
            </body> \
            </html>";
    [_formattedWebView loadHTMLString: _loadText baseURL: nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
