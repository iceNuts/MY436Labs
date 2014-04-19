//
//  LXComputerPlayer.h
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/8/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "moveObj.h"

#define INF 200000

@interface LXComputerPlayer : NSObject

- (int)takeMove: (NSArray*) matrix;

- (moveObj*)performMax: (NSMutableArray*) matrix Depth: (int) depth;

- (moveObj*)performMini:(NSMutableArray *)matrix Depth: (int) depth;

- (int)evaluate: (NSArray*) matrix;

@end
