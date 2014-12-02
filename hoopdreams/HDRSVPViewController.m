//
//  HDRSVPViewController.m
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import "HDRSVPViewController.h"

@interface HDRSVPViewController ()

@end

@implementation HDRSVPViewController {
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
    if (_game) {
        _nameLabel.text = [_game objectForKey:@"name"];
        _spotsLabel.text = [_game objectForKey:@"spots"];
        _notesLabel.text = [_game objectForKey:@"notes"];
        
        if (_notesLabel.text.length == 0) {
            _notesLabel.text = @"No Notes";
        }
    }
    else {
        NSLog(@"Game PF Obj is nil");
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

- (IBAction)submitButtonPressed:(id)sender {
}
@end
