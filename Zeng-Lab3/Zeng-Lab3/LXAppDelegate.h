//
//  LXAppDelegate.h
//  Zeng-Lab3
//
//  Created by Li Zeng on 2/6/14.
//  Copyright (c) 2014 LX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LXStartViewController.h"

@interface LXAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

// ViewControllers
@property (weak, nonatomic) LXStartViewController *startViewController;
@property (weak, nonatomic) UIStoryboard *storyboard;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
