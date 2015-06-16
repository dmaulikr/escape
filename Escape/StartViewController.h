//
//  StartViewController.h
//  Escape
//
//  Created by Tyler Davis on 5/24/14.
//  Copyright (c) 2014 CodeDay. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@interface StartViewController : UIViewController
{
    
    IBOutlet UIButton *easyDif;
    IBOutlet UIButton *medDif;
    IBOutlet UIButton *hardDif;
    
    IBOutlet UIButton *smallSize;
    IBOutlet UIButton *medSize;
    IBOutlet UIButton *largeSize;
    
    IBOutlet UILabel *easyDifLabel;
    IBOutlet UILabel *medDifLabel;
    IBOutlet UILabel *hardDifLabel;
    
    IBOutlet UILabel *smallSizeLabel;
    IBOutlet UILabel *medSizeLabel;
    IBOutlet UILabel *largeSizeLabel;
    
    AppDelegate *app;
    
}

- (IBAction) start: (id) sender;

- (IBAction)easyDif:(id)sender;
- (IBAction)mediumDif:(id)sender;
- (IBAction)hardDif:(id)sender;

- (IBAction)smallSize:(id)sender;
- (IBAction)mediumSize:(id)sender;
- (IBAction)largeSize:(id)sender;

@end
