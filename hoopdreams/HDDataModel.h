//
//  HDDataModel.h
//  hoopdreams
//
//  Created by Walid on 10/21/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HDDataModel : NSObject

// currently only saves data to NSUserDefaults
// possible extension is to connect to parse server

- (void)addNewGame:(NSString *)name andNotes:(NSString *)notes andPeople:(NSString *)spots ;
- (NSArray *)getGame:(int)index;

@end
