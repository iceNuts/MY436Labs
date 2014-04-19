//
//  LXMoveViewController.h
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXGameViewController.h"

@interface LXMoveViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIButton *playerOneBtn;
@property (weak, nonatomic) IBOutlet UIButton *playerTwoBtn;
@property (weak, nonatomic) IBOutlet UIButton *randomBtn;

@property (weak, nonatomic) NSString *btnOneText;
@property (weak, nonatomic) NSString *btnTwoText;

@end
