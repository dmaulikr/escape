//
//  MazeViewController.h
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MazeGeneration.h"
#import "AppDelegate.h"
#import "LoseViewController.h"
#import "WinViewController.h"
#import "Enemy.h"

@interface MazeViewController : UIViewController
{
    AppDelegate *app;
    MazeGeneration *maze;
    Enemy *e;
    Enemy *e2;
    
    IBOutlet UIImageView *one;
    IBOutlet UIImageView *two;
    IBOutlet UIImageView *three;
    IBOutlet UIImageView *four;
    IBOutlet UIImageView *five;
    IBOutlet UIImageView *six;
    IBOutlet UIImageView *seven;
    IBOutlet UIImageView *eight;
    IBOutlet UIImageView *nine;
    IBOutlet UIImageView *ten;
    IBOutlet UIImageView *eleven;
    IBOutlet UIImageView *twelve;
    IBOutlet UIImageView *thirteen;
    IBOutlet UIImageView *fourteen;
    IBOutlet UIImageView *fifteen;
    IBOutlet UIImageView *sixteen;
    IBOutlet UIImageView *seventeen;
    IBOutlet UIImageView *eightteen;
    IBOutlet UIImageView *nineteen;
    IBOutlet UIImageView *twenty;
    IBOutlet UIImageView *twentyone;
    IBOutlet UIImageView *twentytwo;
    IBOutlet UIImageView *twentythree;
    IBOutlet UIImageView *twentyfour;
    IBOutlet UIImageView *twentyfive;
    
    IBOutlet UIImageView *pick1;
    IBOutlet UIImageView *pick2;
    IBOutlet UIImageView *pick3;
    
    IBOutlet UIImageView *health1;
    IBOutlet UIImageView *health2;
    IBOutlet UIImageView *health3;
    
    IBOutlet UILabel *timeLabel;
    
    double time;
    int health;
    int picks;
    int moves;
    int hints;
    bool hint;
    int step;
    int x;
    int y;
    
}

- (IBAction)quit:(id)sender;

 @property IBOutlet UIButton *help;

-(void) updateView;
-(UIImage*) getImage: (int) x int: (int) y;
-(void) screenSwipedRight: (UISwipeGestureRecognizer *) sender;
-(void) screenSwipedDown: (UISwipeGestureRecognizer *) sender;
-(void) screenSwipedLeft: (UISwipeGestureRecognizer *) sender;
-(void) screenSwipedUp: (UISwipeGestureRecognizer *) sender;
-(IBAction)help: (id)sender;
-(void) updateTime;

@property (weak, nonatomic) IBOutlet UIImageView *stickman;
@property NSMutableArray *steps;

@end
