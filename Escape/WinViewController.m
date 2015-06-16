//
//  WinViewController.m
//  Escape
//
//  Created by Maurya on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import "WinViewController.h"

@interface WinViewController ()

@end

@implementation WinViewController

- (IBAction)quit:(id)sender
{
     [self.presentingViewController.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
    
}

- (IBAction)playagain:(id)sender
{
    
    [self.presentingViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];

    if (self) {
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    app  = (AppDelegate*)[UIApplication sharedApplication].delegate;
    [steps setText: [NSString stringWithFormat:@"%d", app.steps]];
    [time setText: [NSString stringWithFormat:@"%.1f", app.times]];
    [score setText: [NSString stringWithFormat:@"%.0f", (1.0 / app.times) * (1.0 / app.steps) * ((app.difficutly + 1) * 300) * app.size * 10000]];
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        [steps setFont:[UIFont fontWithName:@"Dense-Regular" size:40]];
        [time setFont:[UIFont fontWithName:@"Dense-Regular" size:40]];
        [score setFont:[UIFont fontWithName:@"Dense-Regular" size:40]];
    }
    
    else {
        [steps setFont:[UIFont fontWithName:@"Dense-Regular" size:70]];
        [time setFont:[UIFont fontWithName:@"Dense-Regular" size:70]];
        [score setFont:[UIFont fontWithName:@"Dense-Regular" size:70]];
    }
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
