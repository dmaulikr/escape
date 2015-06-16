//
//  MazeGeneration.m
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import "MazeGeneration.h"

@implementation MazeGeneration

-(id) initWithInts: (int) d int: (int) s
{
    
    diff = d;
    size = s;
    [self generate];
    return self;
    
}

-(void) generate
{
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
        {
            
            visited[a][b] = false;
            if(a % 2 == 0 || b % 2 == 0)
                maze[a][b] = 'X';
            else
                maze[a][b] = ' ';
            
        }
    
    [self create:1 int:1];
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
            if(a == 0 || b == 0 || a == size - 1 || b == size - 1)
                maze[a][b] = 'X';
    
    int r = 1 + abs((int) arc4random() % (size - 2));
    int c = 1 + abs((int) arc4random() % (size - 2));
    
    exitX = r;
    exitY = c;
    
    maze[r][c] = 'E';
    
    for(int a = 0; a < size / 10; a ++)
    {
        
        r = 1 + abs((int) arc4random() % (size - 2));
        c = 1 + abs((int) arc4random() % (size - 2));
        
        maze[r][c] = 'P';
        
        r = 1 + abs((int) arc4random() % (size - 2));
        c = 1 + abs((int) arc4random() % (size - 2));
        
        maze[r][c] = 'S';
        
    }
    
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[0][0], maze[0][1], maze[0][2], maze[0][3], maze[0][4], maze[0][5], maze[0][6], maze[0][7], maze[0][8], maze[0][9], maze[0][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[1][0], maze[1][1], maze[1][2], maze[1][3], maze[1][4], maze[1][5], maze[1][6], maze[1][7], maze[1][8], maze[1][9], maze[1][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[2][0], maze[2][1], maze[2][2], maze[2][3], maze[2][4], maze[2][5], maze[2][6], maze[2][7], maze[2][8], maze[2][9], maze[2][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[3][0], maze[3][1], maze[3][2], maze[3][3], maze[3][4], maze[3][5], maze[3][6], maze[3][7], maze[3][8], maze[3][9], maze[3][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[4][0], maze[4][1], maze[4][2], maze[4][3], maze[4][4], maze[4][5], maze[4][6], maze[4][7], maze[4][8], maze[4][9], maze[4][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[5][0], maze[5][1], maze[5][2], maze[5][3], maze[5][4], maze[5][5], maze[5][6], maze[5][7], maze[5][8], maze[5][9], maze[5][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[6][0], maze[6][1], maze[6][2], maze[6][3], maze[6][4], maze[6][5], maze[6][6], maze[6][7], maze[6][8], maze[6][9], maze[6][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[7][0], maze[7][1], maze[7][2], maze[7][3], maze[7][4], maze[7][5], maze[7][6], maze[7][7], maze[7][8], maze[7][9], maze[7][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[8][0], maze[8][1], maze[8][2], maze[8][3], maze[8][4], maze[8][5], maze[8][6], maze[8][7], maze[8][8], maze[8][9], maze[8][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c", maze[9][0], maze[9][1], maze[9][2], maze[9][3], maze[9][4], maze[9][5], maze[9][6], maze[9][7], maze[9][8], maze[9][9], maze[9][10]);
    NSLog(@"%c%c%c%c%c%c%c%c%c%c%c\n", maze[10][0], maze[10][1], maze[10][2], maze[10][3], maze[10][4], maze[10][5], maze[10][6], maze[10][7], maze[10][8], maze[10][9], maze[10][10]);
    
}

-(void) create: (int) x int: (int) y
{
    
    visited[x][y] = true;
    
    NSMutableArray *neighbors = [[NSMutableArray alloc]init];
    
    if(x >= 0 && x < size && y >= 0 && y < size)
    {
        
        if(x + 2 < size && !(visited[x + 2][y])) [neighbors addObject:@"S"];
        
        if(x - 2 >= 0 && !(visited[x - 2][y])) [neighbors addObject:@"N"];
        
        if(y + 2 < size && !(visited[x][y + 2])) [neighbors addObject:@"E"];
        
        if(y - 2 >= 0 && !(visited[x][y - 2])) [neighbors addObject:@"W"];
        
    }
    
    int rand;
    
    if([neighbors count] == 0)
        rand = -1;
    else
        rand = abs((int)(arc4random()) % ([neighbors count]));
    
    while ((rand != -1))
    {
        
        NSString *next = [neighbors objectAtIndex:rand];
        
        if([next isEqualToString:@"N"])
            if(!(visited[x - 2][y]))
            {
                
                maze[x - 1][y] = ' ';
                [self create:x - 2 int:y];
                
            }
        
        if([next isEqualToString:@"S"])
            if(!(visited[x + 2][y]))
            {
                
                maze[x + 1][y] = ' ';
                [self create:x + 2 int:y];
                
            }
        
        if([next isEqualToString:@"E"])
            if(!(visited[x][y + 2]))
            {
                
                maze[x][y + 1] = ' ';
                [self create:x int:y + 2];
                
            }
        
        if([next isEqualToString:@"W"])
            if(!(visited[x][y - 2]))
            {
                
                maze[x][y - 1] = ' ';
                [self create:x int:y - 2];
                
            }
        
        int r = abs((int) arc4random() % 10);
        
        if(r < 1)
        {
            
            NSString *d = [neighbors objectAtIndex:((int) arc4random() % ([neighbors count]))];
            
            if([d isEqualToString:@"S"])
                maze[x + 1][y] = ' ';
            
            if([d isEqualToString:@"N"])
                maze[x - 1][y] = ' ';
            
            if([d isEqualToString:@"E"])
                maze[x][y - 1] = ' ';
            
            if([d isEqualToString:@"W"])
                maze[x][y + 1] = ' ';
            
        }
        
        [neighbors removeObjectAtIndex:rand];
        
        if([neighbors count] == 0)
            rand = -1;
        else
            rand = (int)(arc4random()) % ([neighbors count]);
        
    }
    
}

-(char) getSpot: (int) x int: (int) y
{
    
    return maze[x][y];
    
}

-(void) setSpot: (int) x int: (int) y char: (char) c
{
    
    maze[x][y] = c;
    
}

-(void) solveIt: (int) x : (int) y
{
    solution = @"";
    shortest = 99999999;
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
            solved[a][b] = maze[a][b];

    
    [self solve: x : y : 0];
    
    int count = 0;
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
        {
            
            solved[a][b] = [solution characterAtIndex:count];
            count ++;
            
        }
}

-(void) solve: (int) x : (int) y : (int) count
{
    
    if(x >= 0 && x < size && y >= 0 && y < size && (solved[x][y] != 'X' && solved[x][y] != 'O') && count < shortest)
    {
        
        if(solved[x][y] == 'E')
        {
            NSLog(@"Blah2");
                
            solution = @"";
                
            for(int a = 0; a < size; a ++)
                for(int b = 0; b < size; b ++)
                    solution = [solution stringByAppendingString: [NSString stringWithFormat:@"%c", solved[a][b]]];
            
            shortest = count;
            
        }
        else
        {
            
            solved[x][y] = 'O';
            
            [self solve: x + 1 : y : count + 1];
            [self solve: x - 1 : y : count + 1];
            [self solve: x : y + 1 : count + 1];
            [self solve: x : y - 1 : count + 1];
            
            solved[x][y] = ' ';
            
        }
        
    }
    
}

-(int) getFewestSteps
{
    
    return shortest;
    
}

-(char) getSolvedSpot: (int) x int: (int) y
{
    
    return solved[x][y];
    
}

-(void) solveIt2: (int) x : (int) y : (int) x2 : (int) y2
{
    
    personx = x2;
    persony = y2;
    
    solution2 = @"";
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
            solved2[a][b] = maze[a][b];
    
    
    [self solve2: x : y : 0];
    
    int count = 0;
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
        {
            
            solved2[a][b] = [solution2 characterAtIndex:count];
            count ++;
            
        }
}

-(void) solve2: (int) x : (int) y : (int) count
{
    
    if(x >= 0 && x < size && y >= 0 && y < size && (solved2[x][y] != 'X' && solved2[x][y] != 'O'))
    {
        
        if(![solution2 isEqualToString:@""])
            return;
        
        if(x == personx && y == persony)
        {
            
            solved2[x][y] = 'O';
            
            solution2 = @"";
            
            for(int a = 0; a < size; a ++)
                for(int b = 0; b < size; b ++)
                    solution2 = [solution2 stringByAppendingString: [NSString stringWithFormat:@"%c", solved2[a][b]]];
            
            return;
            
        }
        else
        {
            
            solved2[x][y] = 'O';
            
            [self solve2: x + 1 : y : count + 1];
            [self solve2: x - 1 : y : count + 1];
            [self solve2: x : y + 1 : count + 1];
            [self solve2: x : y - 1 : count + 1];
            
            solved2[x][y] = ' ';
            
        }
    }
}

-(char) getSolvedSpot2: (int) x int: (int) y
{
    
    return solved2[x][y];
    
}

-(int) getExitX
{
    
    return exitX;
    
}

-(int) getExitY
{
    
    return exitY;
    
}

-(void) solveIt3: (int) x : (int) y : (int) x2 : (int) y2
{
    
    personx = x2;
    persony = y2;
    
    solution3 = @"";
    shortest3 = 999999999;
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
            solved3[a][b] = maze[a][b];
    
    
    [self solve3: x : y : 0];
    
    int count = 0;
    
    for(int a = 0; a < size; a ++)
        for(int b = 0; b < size; b ++)
        {
            
            solved3[a][b] = [solution3 characterAtIndex:count];
            count ++;
            
        }
    
}

-(void) solve3: (int) x : (int) y : (int) count
{
    
    if(x >= 0 && x < size && y >= 0 && y < size && (solved3[x][y] != 'X' && solved3[x][y] != 'O'))
    {
        
        if(x == personx && y == persony)
        {
            
            solved3[x][y] = 'O';
            
            solution3 = @"";
                
            for(int a = 0; a < size; a ++)
                for(int b = 0; b < size; b ++)
                    solution3 = [solution3 stringByAppendingString: [NSString stringWithFormat:@"%c", solved3[a][b]]];
            
            shortest3 = count;
            
        }
        else
        {
            
            solved3[x][y] = 'O';
            
            [self solve3: x + 1 : y : count + 1];
            [self solve3: x - 1 : y : count + 1];
            [self solve3: x : y + 1 : count + 1];
            [self solve3: x : y - 1 : count + 1];
            
            solved3[x][y] = ' ';
            
        }
        
    }
    
}

-(char) getSolvedSpot3: (int) x int: (int) y
{
    
    return solved3[x][y];
    
}

@end
