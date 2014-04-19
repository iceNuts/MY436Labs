//
//  LXComputerPlayer.m
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/8/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import "LXComputerPlayer.h"

@implementation LXComputerPlayer

// Mini-Max Strategy return 1 - 9
- (int)takeMove: (NSArray*) matrix
{
    moveObj* bestMove = [self performMax: [matrix mutableCopy] Depth: 0];
    return bestMove.choiceMove;
}


- (moveObj*)performMax: (NSMutableArray*) matrix Depth: (int) depth
{
    moveObj* ret = [[moveObj alloc] init];
    int eval = [self evaluate:matrix];
    
    if (eval == 10 || eval == -10 || eval == -11) {
        if (eval == -10) {
            ret.score = eval + depth;
        } else if(eval == 10) {
            ret.score = eval - depth;
        } else {
            ret.score = 0;
        }
        ret.choiceMove = -1;
        return ret;
    }
    
    int choiceMove = -1;
    int score = -1*INF;
    for (int i = 1; i < [matrix count]; i++) {
        if (0 == [matrix[i] intValue]) {
            //Do MiniMax
            NSMutableArray *_matrix = [NSMutableArray arrayWithArray: matrix];
            [_matrix replaceObjectAtIndex:i withObject:@2];
            moveObj* ret = [self performMini: _matrix Depth:depth + 1];
            if (ret.score > score) {
                score = ret.score;
                choiceMove = i;
            }
        }
    }
    ret.score = score;
    ret.choiceMove = choiceMove;
    return ret;
}


- (moveObj*)performMini:(NSMutableArray *)matrix Depth: (int) depth
{
    
    moveObj* ret = [[moveObj alloc] init];
    int eval = [self evaluate:matrix];
    
    if (eval == 10 || eval == -10 || eval == -11) {
        if (eval == -10) {
            ret.score = eval + depth;
        } else if(eval == 10) {
            ret.score = eval - depth;
        } else {
            ret.score = 0;
        }
        ret.choiceMove = -1;
        return ret;
    }
    
    int choiceMove = -1;
    int score = INF;
    for (int i = 1; i < [matrix count]; i++) {
        if (0 == [matrix[i] intValue]) {
            //Do MiniMax
            NSMutableArray *_matrix = [NSMutableArray arrayWithArray: matrix];
            [_matrix replaceObjectAtIndex:i withObject:@1];
            moveObj* ret = [self performMax: _matrix Depth:depth + 1];
            if (ret.score < score) {
                score = ret.score;
                choiceMove = i;
            }
        }
    }
    ret.score = score;
    ret.choiceMove = choiceMove;
    return ret;
}

// evaluate states
- (int)evaluate:(NSArray *)matrix
{
    NSMutableArray *winIndexSet = [[NSMutableArray alloc] initWithObjects:
                   @1, @2, @3,
                   @1, @4, @7,
                   @1, @5, @9,
                   @2, @5, @8,
                   @3, @6, @9,
                   @3, @5, @7,
                   @4, @5, @6,
                   @7, @8, @9,
                   nil ];
    
    BOOL boardFilled = YES;
    for (int i = 0; i < [winIndexSet count]; i += 3) {
        int r0 = [matrix[[winIndexSet[i] intValue]] intValue];
        int r1 = [matrix[[winIndexSet[i+1] intValue]] intValue];
        int r2 = [matrix[[winIndexSet[i+2] intValue]] intValue];
        if (r0 == 0 || r1 == 0 || r2 == 0)  boardFilled = NO;
        if(r0 == r1 && r1 == r2 && r0 != 0) {
            if (r0 == 1)    return -10;
            else if (r0 == 2)    return 10;
        }
    }
    if (boardFilled) {
        return -11;
    }
    return 0;
}

@end
