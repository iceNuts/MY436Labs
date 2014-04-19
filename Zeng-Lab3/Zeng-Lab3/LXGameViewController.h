//
//  LXGameViewController.h
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXComputerPlayer.h"

@interface LXGameViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *pieceView1;
@property (weak, nonatomic) IBOutlet UIImageView *pieceView2;

@property (weak, nonatomic) IBOutlet UIImageView *gbView1;
@property (weak, nonatomic) IBOutlet UIImageView *gbView2;
@property (weak, nonatomic) IBOutlet UIImageView *gbView3;
@property (weak, nonatomic) IBOutlet UIImageView *gbView4;
@property (weak, nonatomic) IBOutlet UIImageView *gbView5;
@property (weak, nonatomic) IBOutlet UIImageView *gbView6;
@property (weak, nonatomic) IBOutlet UIImageView *gbView7;
@property (weak, nonatomic) IBOutlet UIImageView *gbView8;
@property (weak, nonatomic) IBOutlet UIImageView *gbView9;

@property (weak, nonatomic) IBOutlet UILabel *pieceLabel1;
@property (weak, nonatomic) IBOutlet UILabel *pieceLabel2;
@property (weak, nonatomic) IBOutlet UILabel *gameResultLabel;

@property (weak, nonatomic) IBOutlet UIButton *playAgainBtn;

@property (weak, nonatomic) NSString *playerName1;
@property (weak, nonatomic) NSString *playerName2;

@property (weak, nonatomic) UIImage *playerOnePiece;
@property (weak, nonatomic) UIImage *playerTwoPiece;

@property (weak, nonatomic) NSString *whoFirst;
@property (nonatomic) BOOL computerPlayer;
@property (nonatomic) BOOL playerOneWin;
@property (nonatomic) BOOL playerOneFirst;
@property (nonatomic) BOOL boardFilled;

@property (strong, nonatomic) NSMutableArray *winIndexSet;
@property (strong, nonatomic) NSSet *gbViewSet;
@property (strong, nonatomic) NSArray *gbViewArray;
@property (strong, atomic) NSMutableArray *matrix;
@property (atomic) int touchTimes;

// AI Section
@property (strong, nonatomic) LXComputerPlayer *computer;


- (void)randomizePiecesForPlayers;
- (void)performTTTEvent: (UIView*) view Index: (int) count WhosTurn: (BOOL) playerOne;
- (BOOL)gameWinCheck;
- (void)disableGameBoard;
- (void)playerTurns;

@end
