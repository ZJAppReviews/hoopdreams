//
//  HDRSVPViewController.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>
#import <Parse/Parse.h>

@interface HDRSVPViewController : UIViewController

@property (strong, nonatomic) PFObject *game;
@property (strong, nonatomic) CLLocation *latestLocation;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;
@property (weak, nonatomic) IBOutlet UILabel *spotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *notesLabel;

- (IBAction)submitButtonPressed:(id)sender;

@end
