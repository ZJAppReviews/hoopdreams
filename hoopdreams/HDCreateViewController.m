//
//  HDCreateViewController.m
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import "HDCreateViewController.h"
#import "HDAppDelegate.h"

@interface HDCreateViewController ()

@end

@implementation HDCreateViewController{
    CLLocation *latestLocation;
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
    self.spotsLabel.text = [NSString stringWithFormat:@"%d", (int)self.spotsStepper.value];
    
    
    if (!self.locationManager) {
        self.locationManager = [[CLLocationManager alloc] init];
        self.locationManager.delegate = self;
        self.locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        self.locationManager.distanceFilter = kCLDistanceFilterNone;
        [self.locationManager startUpdatingLocation];
    }
    
    self.nameTextField.delegate = self;
    self.notesTextField.delegate = self;
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

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    
    return YES;
}

- (IBAction)submitButtonPressed:(id)sender {
//    HDAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
//    
//    [delegate.dataModel addNewGame:self.nameTextField.text andNotes:self.notesTextField.text andPeople:self.spotsStepper.value atLocation:latestLocation];
    if (self.nameTextField.text == nil || [self.nameTextField.text length] == 0) {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error" message:@"Name cannot be left blank." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    else{
    
        if (self.notesTextField.text == nil) {
            self.notesTextField.text = @"";
        }
        
        if (latestLocation == nil) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Error" message:@"There was an error detecting your location. Turn on location services in settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alert show];
        }
        else {
            PFObject *game = [PFObject objectWithClassName:@"Game"];
            PFGeoPoint *geopoint = [PFGeoPoint geoPointWithLatitude:latestLocation.coordinate.latitude longitude:latestLocation.coordinate.longitude];
            game[@"location"] = geopoint;
            game[@"name"] = self.nameTextField.text;
            game[@"notes"] = self.notesTextField.text;
            game[@"spots"] = @(self.spotsStepper.value);
            
            [game saveInBackground];
        }
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)stepperChanged:(id)sender {
    self.spotsLabel.text = [NSString stringWithFormat:@"%d", (int)self.spotsStepper.value];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    latestLocation = [locations lastObject];
    [manager stopUpdatingLocation];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Error" message:@"There was an error detecting your location. Turn on location services in settings." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    [alert show];
}

@end
