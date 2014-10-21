//
//  HDCreateViewController.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HDCreateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *notesTextField;
@property (weak, nonatomic) IBOutlet UILabel *spotsLabel;
@property (weak, nonatomic) IBOutlet UIStepper *spotsStepper;

- (IBAction)submitButtonPressed:(id)sender;

@end
