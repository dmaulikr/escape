//
//  WinViewController.h
//  Escape
//
//  Created by Maurya on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface WinViewController : UIViewController
{
    
    AppDelegate *app;
    IBOutlet UILabel *steps;
    IBOutlet UILabel *score;
    IBOutlet UILabel *time;
    
}

- (IBAction)quit:(id)sender;
- (IBAction)playagain:(id)sender;

@end
