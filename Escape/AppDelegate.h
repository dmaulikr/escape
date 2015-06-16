//
//  AppDelegate.h
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MazeGeneration.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
    
@property (strong, nonatomic) UIWindow *window;

@property MazeGeneration *maze;
@property int difficutly;
@property int size;
@property int steps;
@property double times;

@end
