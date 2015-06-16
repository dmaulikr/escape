//
//  Enemy.m
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import "Enemy.h"

@implementation Enemy @synthesize c;

-(id) initWithSpot:(int)x2 int:(int)y2
{
    
    app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    maze = app.maze;
    
    x = x2;
    y = y2;
    count = 0;
    
    [self updateMaze];
    
    return self;
    
}

-(void) setPerson:(int)x2 int:(int)y2
{
    
    personX = x2;
    personY = y2;
    
}

-(void) move
{
    
    [maze solveIt2:x :y :personX :personY];
    
    if(app.difficutly == 0)
    {
        
        if(count == 0)
            count ++;
        
        else
        {
            
            [maze setSpot:x int:y char:' '];
            
            bool done = false;
            
            for(int a = -1; a <= 1; a += 2)
            {
                
                if([maze getSolvedSpot2:x + a int:y] == 'O')
                {
                    
                    x = x + a;
                    done = true;
                    break;
                    
                }
                
                if([maze getSolvedSpot2:x int:y + a] == 'O')
                {
                    
                    y = y + a;
                    done = true;
                    break;
                    
                }
                
                if(done) break;
                
            }
            
            count = 0;
            
        }
        
    }
    
    else
    {
        
        [maze setSpot:x int:y char:' '];
        
        bool done = false;
        
        for(int a = -1; a <= 1; a += 2)
        {
            
            if([maze getSolvedSpot2:x + a int:y] == 'O')
            {
                
                x = x + a;
                done = true;
                break;
                    
            }
            
            if([maze getSolvedSpot2:x int:y + a] == 'O')
            {
                
                y = y + a;
                done = true;
                break;
                
            }
            
            if(done) break;
            
        }
    }
    
    [self updateMaze];
    
}

-(void) move2
{
    
    [maze solveIt3:x :y :personX :personY];
    
    [maze setSpot:x int:y char:' '];
            
    bool done = false;
            
    for(int a = -1; a <= 1; a += 2)
    {
                
        if([maze getSolvedSpot3:x + a int:y] == 'O')
        {
                
            x = x + a;
            done = true;
            break;
                
        }
                
        if([maze getSolvedSpot3:x int:y + a] == 'O')
        {
                
            y = y + a;
            done = true;
            break;
                    
        }
                
        if(done) break;
                
    }
    
    [self updateMaze];
    
}

-(void) updateMaze
{
    
    [maze setSpot:x int:y char:'M'];
        
}

@end
