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
    _nameLabel.text = [_game objectForKey:@"name"];
    _spotsLabel.text = [[_game objectForKey:@"spots"] stringValue];
    _notesLabel.text = [_game objectForKey:@"notes"];
    
    PFGeoPoint *geopoint = [_game objectForKey:@"location"];
    CLLocation *gameLocation = [[CLLocation alloc] initWithLatitude:geopoint.latitude longitude:geopoint.longitude];
    
    CLLocationDistance distance = [gameLocation distanceFromLocation:_latestLocation];
    _distanceLabel.text = [NSString stringWithFormat:@"%.1f mi", ABS((distance*0.000621371))];
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
