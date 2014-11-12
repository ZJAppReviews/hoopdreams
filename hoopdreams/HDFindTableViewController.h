//
//  HDFindTableViewController.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import "HDAppDelegate.h"
#import "HDTableViewCell.h"
#import <Parse/Parse.h>

@interface HDFindTableViewController : UITableViewController <CLLocationManagerDelegate>{
    CLGeocoder *geocoder;
    CLPlacemark *placemark;
}

@end
