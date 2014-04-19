//
//  LXGameViewController.m
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/7/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LXGameViewController.h"

@interface LXGameViewController ()

@end

@implementation LXGameViewController

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
    
    _touchTimes = 0;
    _computer = [[LXComputerPlayer alloc] init];
    _matrix = [[NSMutableArray alloc] init];
    for (int i = 0; i < 10; i++) {
        [_matrix addObject:[NSNumber numberWithInt: 0]];
    }
    
    _winIndexSet = [[NSMutableArray alloc] initWithObjects:
                    @1, @2, @3,
                    @1, @4, @7,
                    @1, @5, @9,
                    @2, @5, @8,
                    @3, @6, @9,
                    @3, @5, @7,
                    @4, @5, @6,
                    @7, @8, @9,
                    nil ];
    
    _gbViewSet = [NSSet setWithObjects:_gbView1, _gbView2, _gbView3, _gbView4, _gbView5, _gbView6, _gbView7, _gbView8, _gbView9, nil];
    
    _gbViewArray = [NSArray arrayWithObjects:_gbView1, _gbView2, _gbView3, _gbView4, _gbView5, _gbView6, _gbView7, _gbView8, _gbView9, nil];
    
    [self playerTurns];
    
    [self initViews];
    [self randomizePiecesForPlayers];
    
    // Trigger Computer Move
    if (_computerPlayer && !_playerOneFirst) {
    // Computer is always the player 2!!!!!
        int move = 5;
        _touchTimes++;
        [_gbViewArray[(move - 1)] setImage: _playerTwoPiece];
        [_matrix replaceObjectAtIndex: move withObject: [NSNumber numberWithInt: 2]];
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initViews
{
    [_playAgainBtn setHidden: YES];
    if (_computerPlayer) {
        [_gameResultLabel setText:@"Human Turn"];
    } else if(_playerOneFirst) {
        [_gameResultLabel setText:@"Player 1 Turn"];
    } else
        [_gameResultLabel setText:@"Player 2 Turn"];
}

- (void)randomizePiecesForPlayers
{
    _playerName1 = _computerPlayer? @"Human" : @"Player 1";
    _playerName2 = _computerPlayer? @"Computer" : @"Player 2";
    
    int r = arc4random_uniform(10);
    if (r < 5) {
        _pieceLabel1.text = _playerName1;
        _pieceLabel2.text = _playerName2;
        _playerOnePiece = [UIImage imageNamed:@"batman.png"];
        _playerTwoPiece = [UIImage imageNamed:@"clown.jpg"];
        
    } else {
        _pieceLabel1.text = _playerName2;
        _pieceLabel2.text = _playerName1;
        _playerTwoPiece = [UIImage imageNamed:@"batman.png"];
        _playerOnePiece = [UIImage imageNamed:@"clown.jpg"];
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    
    UITouch *touch = [touches anyObject];
    
    UIView *touchedView = [touch view];
    
    for (UIView *view in _gbViewSet) {
        if (touchedView.tag == view.tag) {
            if (0 == [_matrix[view.tag] intValue]) {
                _touchTimes++;
            }
            
            BOOL firstPlayerPlaying;
            if(_playerOneFirst) {
                firstPlayerPlaying = _touchTimes%2 != 0;
            } else {
                firstPlayerPlaying = !(_touchTimes%2 != 0);
            }
            if (_computerPlayer) {
                firstPlayerPlaying = YES;
            }
            [self performTTTEvent: view Index: view.tag WhosTurn: firstPlayerPlaying];
        }
    }
    
}

- (void)performTTTEvent: (UIView*) view Index: (int) count WhosTurn: (BOOL) playerOne{
    
    // Update Player Turns
    if (_computerPlayer)
        [_gameResultLabel setText:@"Human Turn"];
    else if (!playerOne) {
        [_gameResultLabel setText:@"Player 1 Turn"];
    } else {
        [_gameResultLabel setText:@"Player 2 Turn"];
    }
    
    // Playing with Computer
    if (_computerPlayer) {
        if(0 == [_matrix[count] intValue])
        {
            if (playerOne) {
                [(UIImageView*) view setImage: _playerOnePiece];
                [_matrix replaceObjectAtIndex: count withObject: [NSNumber numberWithInt: 1]];
                
                // Computer Move
                int move = [_computer takeMove: _matrix];

                if (-1 != move) {
                    [_gbViewArray[(move - 1)] setImage: _playerTwoPiece];
                    [_matrix replaceObjectAtIndex: move withObject: [NSNumber numberWithInt: 2]];
                }
                // End Of If
            }
        }
    // End Of If
    } else {
    // Playing with Human
        if(0 == [_matrix[count] intValue])
        {
            if (playerOne) {
                [(UIImageView*) view setImage: _playerOnePiece];
                [_matrix replaceObjectAtIndex: count withObject: [NSNumber numberWithInt: 1]];
            } else {
                [(UIImageView*) view setImage: _playerTwoPiece];
                [_matrix replaceObjectAtIndex: count withObject: [NSNumber numberWithInt: 2]];
            }
        // End of if
        }
        // End of if
    }
    
    // Do Win Check
    
    if([self gameWinCheck]) {
        [_playAgainBtn setHidden: NO];
        [_gameResultLabel setHidden: NO];
        
        if (_playerOneWin) {
            NSMutableString *text = [[NSMutableString alloc] init];
            [text appendString: _playerName1];
            [text appendString: @" has won!"];
            [_gameResultLabel setText: text];
        } else {
            NSMutableString *text = [[NSMutableString alloc] init];
            [text appendString: _playerName2];
            [text appendString: @" has won!"];
            [_gameResultLabel setText: text];
        }
    } else if(_boardFilled){
        [_playAgainBtn setHidden: NO];
        [_gameResultLabel setHidden: NO];
        [_gameResultLabel setText: @"OH >< It's a tie!"];
    }
}

- (void)disableGameBoard
{
    for (UIView *view in _gbViewSet) {
        [view setUserInteractionEnabled: NO];
    }
}

- (BOOL)gameWinCheck
{
    _boardFilled = YES;
    for (int i = 0; i < [_winIndexSet count]; i += 3) {
        int r0 = [_matrix[[_winIndexSet[i] intValue]] intValue];
        int r1 = [_matrix[[_winIndexSet[i+1] intValue]] intValue];
        int r2 = [_matrix[[_winIndexSet[i+2] intValue]] intValue];
        if (r0 == 0 || r1 == 0 || r2 == 0)  _boardFilled = NO;
        if(r0 == r1 && r1 == r2 && r0 != 0) {
            if (r0 == 1)    _playerOneWin = YES;
            else if (r0 == 2)    _playerOneWin = NO;
            [self disableGameBoard];
            return YES;
        }
    }
    if (_boardFilled) {
        [self disableGameBoard];
        return FALSE;
    }
    return FALSE;
}

- (void)playerTurns
{
    if ([_whoFirst isEqualToString:@"one"]) {
        _playerOneFirst = YES;
    } else if ([_whoFirst isEqualToString:@"two"]) {
         _playerOneFirst = NO;
    } else if ([_whoFirst isEqualToString:@"random"]) {
        int r = arc4random_uniform(10);
        if (r < 5) {
            _playerOneFirst = YES;
        } else {
            _playerOneFirst = NO;
        }
    }
    // End Of If
}

@end






