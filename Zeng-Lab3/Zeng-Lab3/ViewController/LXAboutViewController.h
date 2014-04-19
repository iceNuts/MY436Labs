//
//  LXAboutViewController.h
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LXAboutViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *formattedWebView;
@property (weak, nonatomic) NSString *loadText;


@end
