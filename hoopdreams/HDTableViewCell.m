//
//  HDTableViewCell.m
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import "HDTableViewCell.h"

@implementation HDTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
