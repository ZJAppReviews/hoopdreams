//
//  HDFindTableViewController.m
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import "HDFindTableViewController.h"

@interface HDFindTableViewController ()

@end

@implementation HDFindTableViewController{
    CLLocationManager *locManager;
    CLLocation *latestLocation;
    
    NSArray *objects;
}

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    
    geocoder = [[CLGeocoder alloc] init];
    if (locManager == nil) {
        locManager = [[CLLocationManager alloc] init];
        locManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
        locManager.delegate = self;
    }
    
    [locManager startUpdatingLocation];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self update];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [objects count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HDTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    
    // Configure the cell...
    if (cell) {
        PFObject *game = [objects objectAtIndex:indexPath.row];
        cell.game = game;
        cell.nameLabel.text = [game objectForKey:@"name"];
        cell.spotsLabel.text = [[game objectForKey:@"spots"] stringValue];
        
        PFGeoPoint *geopoint = [game objectForKey:@"location"];
        CLLocation *gameLocation = [[CLLocation alloc] initWithLatitude:geopoint.latitude longitude:geopoint.longitude];
        
        CLLocationDistance distance = [gameLocation distanceFromLocation:latestLocation];
        cell.distanceLabel.text = [NSString stringWithFormat:@"%.1f mi", ABS((distance*0.000621371))];
    }
    
    return cell;
}



//#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//{
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([segue.identifier isEqualToString:@"RSVP"]) {
//        HDRSVPViewController *rsvpVC = segue.destinationViewController;
//        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
//        PFObject *selected = [objects objectAtIndex:indexPath.row];
//        
//        rsvpVC.game = selected;
//    }
//}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {
    latestLocation = [locations lastObject];
    
    [self update];
}

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Location Error" message:@"There was an error detecting your location. Turn on location services in settings." delegate:self cancelButtonTitle:@"Okay" otherButtonTitles:nil, nil];
    [alert show];
}


- (void)update{
    PFGeoPoint *geopoint = [PFGeoPoint geoPointWithLatitude:latestLocation.coordinate.latitude longitude:latestLocation.coordinate.longitude];
    
    HDAppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    
    PFQuery *queryDistance = [PFQuery queryWithClassName:@"Game"];
    [queryDistance whereKey:@"location" nearGeoPoint:geopoint withinMiles:delegate.settingDistance];
    
    objects = [queryDistance findObjects];
    
    NSMutableArray *filtered = [[NSMutableArray alloc] init];
    for (PFObject *PFobj in objects) {
        int spots = [[PFobj objectForKey:@"spots"] intValue];
        
        switch (delegate.settingSpots) {
            case kGameSizeAny:
                [filtered addObject:PFobj];
                break;
                
            case kGameSizeSmall:
                if (spots < 3) {
                    [filtered addObject:PFobj];
                }
                break;
                
            case kGameSizeMedium:
                if (spots == 3) {
                    [filtered addObject:PFobj];
                }
                break;
                
            case kGameSizeLarge:
                if (spots > 3) {
                    [filtered addObject:PFobj];
                }
                break;
                
            default:
                NSLog(@"Invalid game size setting.");
                break;
        }
    }
    
    objects = filtered;
    
    [self.tableView reloadData];
}

@end
