//
//  HDDataModel.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@interface HDDataModel : NSObject

// currently only saves data to NSUserDefaults
// possible extension is to connect to parse server

- (void)addNewGame:(NSString *)name andNotes:(NSString *)notes andPeople:(int)spots atLocation:(CLLocation *)location;
- (NSArray *)getGame:(NSInteger)index;
- (NSInteger)count;

@end
