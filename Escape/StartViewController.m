//
//  StartViewController.m
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import "StartViewController.h"
#import "MazeViewController.h"
#import "MazeGeneration.h"
#import "AppDelegate.h"

@interface StartViewController ()

@end

@implementation StartViewController

- (IBAction)easyDif:(id)sender {
    
    app.difficutly = 0;
    
    [easyDifLabel setTextColor:[UIColor whiteColor]];
    [medDifLabel setTextColor:[UIColor clearColor]];
    [hardDifLabel setTextColor:[UIColor clearColor]];
    
}
- (IBAction)mediumDif:(id)sender {
    
    app.difficutly = 1;
    
    [easyDifLabel setTextColor:[UIColor clearColor]];
    [medDifLabel setTextColor:[UIColor whiteColor]];
    [hardDifLabel setTextColor:[UIColor clearColor]];
    
}
- (IBAction)hardDif:(id)sender {
    
    app.difficutly = 2;
    
    [easyDifLabel setTextColor:[UIColor clearColor]];
    [medDifLabel setTextColor:[UIColor clearColor]];
    [hardDifLabel setTextColor:[UIColor whiteColor]];
    
}

- (IBAction)smallSize:(id)sender {
    
    app.size = 11;
    
    [smallSizeLabel setTextColor:[UIColor whiteColor]];
    [medSizeLabel setTextColor:[UIColor clearColor]];
    [largeSizeLabel setTextColor:[UIColor clearColor]];
    
}
- (IBAction)mediumSize:(id)sender {
    
    app.size = 21;
    
    [smallSizeLabel setTextColor:[UIColor clearColor]];
    [medSizeLabel setTextColor:[UIColor whiteColor]];
    [largeSizeLabel setTextColor:[UIColor clearColor]];
    
}
- (IBAction)largeSize:(id)sender {
    
    app.size = 31;
    
    [smallSizeLabel setTextColor:[UIColor clearColor]];
    [medSizeLabel setTextColor:[UIColor clearColor]];
    [largeSizeLabel setTextColor:[UIColor whiteColor]];
    
}

-(IBAction) start: (id) sender
{
    
    MazeGeneration *maze = [[MazeGeneration alloc]initWithInts:app.difficutly int:app.size];
    
    app.maze = maze;
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
        MazeViewController *mazeView = [storyboard instantiateViewControllerWithIdentifier:@"Maze"];
        [self presentViewController:mazeView animated:YES completion:nil];
        
    }
    else {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPadStoryboard" bundle:nil];
        MazeViewController *mazeView = [storyboard instantiateViewControllerWithIdentifier:@"Maze"];
        [self presentViewController:mazeView animated:YES completion:nil];
        
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
    // Do any additional setup after loading the view.
    
    app = (AppDelegate*)[UIApplication sharedApplication].delegate;
    app.difficutly = 0;
    app.size = 11;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
