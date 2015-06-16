//
//  MazeGeneration.h
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MazeGeneration : NSObject
{
    
    
    bool visited[101][101];
    char maze[101][101];
    int personx;
    int persony;
    int exitX;
    int exitY;
    int diff;
    int size;
    
    char solved[101][101];
    NSString *solution;
    int shortest;
    
    char solved2[101][101];
    NSString *solution2;
    
    char solved3[101][101];
    NSString *solution3;
    int shortest3;
    
}

-(id) initWithInts: (int) d int: (int) s;
-(void) generate;
-(void) create: (int) x int: (int) y;
-(char) getSpot: (int) x int: (int) y;
-(void) setSpot: (int) x int: (int) y char: (char) c;
-(int) getExitX;
-(int) getExitY;
-(int) getFewestSteps;

-(void) solveIt: (int) x : (int) y;
-(void) solve: (int) x : (int) y : (int) count;
-(char) getSolvedSpot: (int) x int: (int) y;

-(void) solveIt2: (int) x : (int) y : (int) x2 : (int) y2;
-(void) solve2: (int) x : (int) y : (int) count;
-(char) getSolvedSpot2: (int) x int: (int) y;

-(void) solveIt3: (int) x : (int) y : (int) x2 : (int) y2;
-(void) solve3: (int) x : (int) y : (int) count;
-(char) getSolvedSpot3: (int) x int: (int) y;

@end
