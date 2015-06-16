//
//  MainViewController.m
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController


-(IBAction)start:(id)sender {
    
    if ([UIDevice currentDevice].userInterfaceIdiom == UIUserInterfaceIdiomPhone)
    {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPhoneStoryboard" bundle:nil];
        StartViewController *startView = [storyboard instantiateViewControllerWithIdentifier:@"Start"];
        [self presentViewController:startView animated:YES completion:nil];
        
    }
    else {
        UIStoryboard* storyboard = [UIStoryboard storyboardWithName:@"iPadStoryboard" bundle:nil];
        StartViewController *startView = [storyboard instantiateViewControllerWithIdentifier:@"Start"];
        [self presentViewController:startView animated:YES completion:nil];
        
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
