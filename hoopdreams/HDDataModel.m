//
//  HDDataModel.m
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import "HDDataModel.h"
#import <CoreLocation/CoreLocation.h>

@implementation HDDataModel{
    NSMutableArray *data;
}

// currently only saves data to NSUserDefaults
// possible extension is to connect to parse server

- (instancetype)init{
    self = [super init];
    
    if (self) {
        if (!data) {
            data = [[NSMutableArray alloc] init];
        }
    }
    
    return self;
}

- (void)addNewGame:(NSString *)name andNotes:(NSString *)notes andPeople:(int)spots atLocation:(CLLocation *)location{
    [data addObject:@[name, notes, @(spots), location]];
}

- (NSArray *)getGame:(int)index{
    return [data objectAtIndex:index];
}

@end
