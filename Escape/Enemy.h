//
//  Enemy.h
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "MazeGeneration.h"

@interface Enemy : NSObject
{
    
    AppDelegate *app;
    MazeGeneration *maze;
    
    int x;
    int y;
    int personX;
    int personY;
    int count;
    
}

@property char c;

-(id) initWithSpot: (int) x int: (int) y;
-(void) setPerson: (int)x2 int:(int)y2;
-(void) move;
-(void) move2;

@end
