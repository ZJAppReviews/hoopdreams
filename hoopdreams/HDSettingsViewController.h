//
//  HDSettingsViewController.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDAppDelegate.h"

@interface HDSettingsViewController : UIViewController


@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UISlider *distanceSlider;
@property (weak, nonatomic) IBOutlet UISegmentedControl *gameSize;
@property (weak, nonatomic) IBOutlet UIButton *submitButtonPressed;

- (IBAction)distanceValueChanged:(id)sender;
- (IBAction)donePressed:(id)sender;

@end
