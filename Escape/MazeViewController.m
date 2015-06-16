//
//  MazeViewController.m
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import "MazeViewController.h"

@interface MazeViewController ()

@end

@implementation MazeViewController @synthesize steps, stickman, help;

- (IBAction)quit:(id)sender
{
    
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

-(void) updateView
{
    
    if([maze getSpot:[maze getExitX] int:[maze getExitY]] == 'M')
        [maze setSpot:[maze getExitX] int:[maze getExitY] char:'Q'];
    else
        [maze setSpot:[maze getExitX] int:[maze getExitY] char:'E'];
    
    if([maze getSpot:x int:y] == 'M')
    {
        
        if(health <= 0)
        {
        
            if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
            {
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
                LoseViewController *loseView = [storyboard instantiateViewControllerWithIdentifier:@"Lose"];
                [self presentViewController:loseView animated:YES completion:nil];
            
            }
            else
            {
                UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPadStoryboard" bundle:nil];
                LoseViewController *loseView = [storyboard instantiateViewControllerWithIdentifier:@"Lose"];
                [self presentViewController:loseView animated:YES completion:nil];
            
            }
            
        }
        else
        {
            
            health --;
            
            [self updateHealth];
            
        }
        
    }
    
    else if([maze getSpot:x int:y] == 'E' || [maze getSpot:x int:y] == 'Q')
    {

        app.steps = step;
        app.times = time;
        
        if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
        {
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
            WinViewController *winView = [storyboard instantiateViewControllerWithIdentifier:@"Win"];
            [self presentViewController:winView animated:YES completion:nil];
        
        }
        else {
            UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPadStoryboard" bundle:nil];
            WinViewController *winView = [storyboard instantiateViewControllerWithIdentifier:@"Win"];
            [self presentViewController:winView animated:YES completion:nil];
        
        }
        
    }
    
    else if([maze getSpot:x int:y] == 'S')
    {
        
        health ++;
        
        [self updateHealth];
        
        [maze setSpot:x int:y char:' '];
        
    }
    
    else if([maze getSpot:x int:y] == 'P')
    {
        
        picks ++;
        
        [self updatePicks];
        
        [maze setSpot:x int:y char:' '];
        
    }
    
    [one setImage:          [self getImage:x - 2 int:y - 2]];
    [two setImage:          [self getImage:x - 2 int:y - 1]];
    [three setImage:        [self getImage:x - 2 int:y]];
    [four setImage:         [self getImage:x - 2 int:y + 1]];
    [five setImage:         [self getImage:x - 2 int:y + 2]];
    
    [six setImage:          [self getImage:x - 1 int:y - 2]];
    [seven setImage:        [self getImage:x - 1 int:y - 1]];
    [eight setImage:        [self getImage:x - 1 int:y]];
    [nine setImage:         [self getImage:x - 1 int:y + 1]];
    [ten setImage:          [self getImage:x - 1 int:y + 2]];
    
    [eleven setImage:       [self getImage:x int:y - 2]];
    [twelve setImage:       [self getImage:x int:y - 1]];
    [thirteen setImage:     [self getImage:x int:y]];
    [fourteen setImage:     [self getImage:x int:y + 1]];
    [fifteen setImage:      [self getImage:x int:y + 2]];
    
    [sixteen setImage:      [self getImage:x + 1 int:y - 2]];
    [seventeen setImage:    [self getImage:x + 1 int:y - 1]];
    [eightteen setImage:    [self getImage:x + 1 int:y]];
    [nineteen setImage:     [self getImage:x + 1 int:y + 1]];
    [twenty setImage:       [self getImage:x + 1 int:y + 2]];
    
    [twentyone setImage:    [self getImage:x + 2 int:y - 2]];
    [twentytwo setImage:    [self getImage:x + 2 int:y - 1]];
    [twentythree setImage:  [self getImage:x + 2 int:y]];
    [twentyfour setImage:   [self getImage:x + 2 int:y + 1]];
    [twentyfive setImage:   [self getImage:x + 2 int:y + 2]];
    
    
}

-(UIImage*) getImage: (int) x2 int: (int) y2
{

    if(hint)
    {
        
        if([maze getSpot:x2 int:y2] == 'M')
            return [UIImage imageNamed:@"monster.png"];
        else if([maze getSolvedSpot:x2 int:y2] == 'O')
            return [UIImage imageNamed:@"path_hint.png"];
        else if([maze getSpot:x2 int:y2] == ' ')
            return [UIImage imageNamed:@"path.png"];
        else if([maze getSpot:x2 int:y2] == 'E')
            return [UIImage imageNamed:@"exit_vertical.png"];
        else if([maze getSpot:x2 int:y2] == 'S')
            return [UIImage imageNamed:@"shield.png"];
        else if([maze getSpot:x2 int:y2] == 'P')
            return [UIImage imageNamed:@"pickaxe.png"];
        else if([maze getSpot:x2 int:y2] == 'Q')
            return [UIImage imageNamed:@"monster_exit"];
        else
            return [UIImage imageNamed:@"wall.png"];
        
    }
    else
    {
        
        if([maze getSpot:x2 int:y2] == 'M')
            return [UIImage imageNamed:@"monster.png"];
        else if([maze getSpot:x2 int:y2] == ' ')
            return [UIImage imageNamed:@"path.png"];
        else if([maze getSpot:x2 int:y2] == 'E')
            return [UIImage imageNamed:@"exit_vertical.png"];
        else if([maze getSpot:x2 int:y2] == 'S')
            return [UIImage imageNamed:@"shield.png"];
        else if([maze getSpot:x2 int:y2] == 'P')
            return [UIImage imageNamed:@"pickaxe.png"];
        else if([maze getSpot:x2 int:y2] == 'Q')
            return [UIImage imageNamed:@"monster_exit"];
        else
            return [UIImage imageNamed:@"wall.png"];
        
    }
    
}

-(IBAction)help: (id)sender
{
    
    [maze solveIt:x :y];
    
    hints ++;
    hint = true;
    [self updateView];
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(blah)
                                   userInfo:nil
                                    repeats:NO];
    
    if(app.difficutly == 1 && hints >= 5)
        [help setHidden:YES];
        
    
}

-(void) blah
{
    
    hint = false;
    [self updateView];
    
}

-(void) updateTime
{
    
    time += .1;
    
    [timeLabel setText:[[NSString alloc] initWithFormat:@"Time: %.1f", time]];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        [timeLabel setFont:[UIFont fontWithName:@"Dense-Regular" size:30]];
    }
    
    else {
        [timeLabel setFont:[UIFont fontWithName:@"Dense-Regular" size:70]];
    }
    
    [NSTimer scheduledTimerWithTimeInterval:0.1
                                     target:self
                                   selector:@selector(updateTime)
                                   userInfo:nil
                                    repeats:NO];
    
    
}

-(void) screenSwipedRight: (UISwipeGestureRecognizer *) sender
{
    
    if([maze getSpot:x int:y - 1] != 'X')
    {
        
        step ++;
        
        y -= 1;
        
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
    else if(picks > 0)
    {
        
        step ++;
        
        picks --;
        
        [self updatePicks];
        
        [maze setSpot:x int:y - 1 char:' '];
        
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
    
}

-(void) screenSwipedDown: (UISwipeGestureRecognizer *) sender
{
    if([maze getSpot:x - 1 int:y] != 'X')
    {
        
        step ++;
        
        x -= 1;

        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
    else if(picks > 0)
    {
        
        step ++;
        
        picks --;
        
        [self updatePicks];
        
        [maze setSpot:x - 1 int:y char:' '];
        
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
}

-(void) screenSwipedLeft: (UISwipeGestureRecognizer *) sender
{
    if([maze getSpot:x int:y + 1] != 'X')
    {
        
        step ++;
        
        y += 1;
        
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
    else if(picks > 0)
    {
        
        step ++;
        
        picks --;
        
        [self updatePicks];
        
        [maze setSpot:x int:y + 1 char:' '];
        
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
}

-(void) screenSwipedUp: (UISwipeGestureRecognizer *) sender
{
    if([maze getSpot:x + 1 int:y] != 'X')
    {
        
        step ++;
        
        x += 1;
    
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
    
    else if(picks > 0)
    {
        
        step ++;
        
        picks --;
        
        [self updatePicks];
        
        [maze setSpot:x + 1 int:y char:' '];
        
        if(app.difficutly == 0)
        {
            
            [e setPerson:x int:y];
            [e move];
            
        }
        else if(app.difficutly == 1)
        {
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        else if(app.difficutly == 2)
        {
            
            [e setPerson:x int:y];
            [e move];
            
            [e2 setPerson:x int:y];
            [e2 move2];
            
        }
        
        [self updateView];
        
    }
}

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
    
    UISwipeGestureRecognizer *swipeUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(screenSwipedUp:)];
    swipeUp.numberOfTouchesRequired = 1;
    swipeUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeUp];
    
    UISwipeGestureRecognizer *swipeDown = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(screenSwipedDown:)];
    swipeDown.numberOfTouchesRequired = 1;
    swipeDown.direction = UISwipeGestureRecognizerDirectionDown;
    [self.view addGestureRecognizer:swipeDown];
    
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(screenSwipedLeft:)];
    swipeLeft.numberOfTouchesRequired = 1;
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    [self.view addGestureRecognizer:swipeLeft];
    
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action: @selector(screenSwipedRight:)];
    swipeRight.numberOfTouchesRequired = 1;
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeRight];
    
    app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    
    maze = app.maze;

    int asd = 1 + abs((int) arc4random()) % (app.size - 2);
    int asd2 = 1 + abs((int) arc4random()) % (app.size - 2);
    
    if(app.difficutly == 0)
        e = [[Enemy alloc]initWithSpot: [maze getExitX] int: [maze getExitY]];
    else if(app.difficutly == 1)
        e2 = [[Enemy alloc]initWithSpot: [maze getExitX] int: [maze getExitY]];
    else if(app.difficutly == 2)
    {
        
        e = [[Enemy alloc]initWithSpot: [maze getExitX] int: [maze getExitY]];
        e2 = [[Enemy alloc]initWithSpot: asd int: asd2];
        
    }
    
    x = 1;
    y = 1;
    
    if(app.difficutly == 2)
        [help setHidden:YES];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        [timeLabel setFont:[UIFont fontWithName:@"Dense-Regular" size:30]];
    }
    
    else {
        [timeLabel setFont:[UIFont fontWithName:@"Dense-Regular" size:70]];
    }
    
    [self updateView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidAppear:(BOOL)animated
{
    
    hint = false;
    health = 0;
    time = 0.0;
    hints = 0;
    moves = 0;
    step = 0;
    x = 1;
    y = 1;
    
    [self updateView];
    [self updateTime];
    
}

-(void) updateHealth
{
    
    if(health == 0)
    {
        
        [health1 setHidden:true];
        [health2 setHidden:true];
        [health3 setHidden:true];
        
    }
    
    else if(health == 1)
    {
        
        [health1 setHidden:false];
        [health2 setHidden:true];
        [health3 setHidden:true];
        
    }
    
    else if(health == 2)
    {
        
        [health1 setHidden:false];
        [health2 setHidden:false];
        [health3 setHidden:true];
        
    }
    
    else if(health == 3)
    {
        
        [health1 setHidden:false];
        [health2 setHidden:false];
        [health3 setHidden:false];
        
    }
    
}

-(void) updatePicks
{
    
    if(picks == 0)
    {
        
        [pick1 setHidden:true];
        [pick2 setHidden:true];
        [pick3 setHidden:true];
        
    }
    
    else if(picks == 1)
    {
        
        [pick1 setHidden:false];
        [pick2 setHidden:true];
        [pick3 setHidden:true];
        
    }
    
    else if(picks == 2)
    {
        
        [pick1 setHidden:false];
        [pick2 setHidden:false];
        [pick3 setHidden:true];
        
    }
    
    else if(picks == 3)
    {
        
        [pick1 setHidden:false];
        [pick2 setHidden:false];
        [pick3 setHidden:false];
        
    }
    
}

@end
