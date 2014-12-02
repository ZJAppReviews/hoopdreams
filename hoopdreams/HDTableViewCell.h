//
//  HDTableViewCell.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface HDTableViewCell : UITableViewCell

@property (strong, nonatomic) PFObject *game;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *spotsLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end
