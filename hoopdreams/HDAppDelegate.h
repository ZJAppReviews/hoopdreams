//
//  HDAppDelegate.h
//  hoopdreams
//
//  Created by Walid Owais on 10/20/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kGameSizeAny 0
#define kGameSizeSmall 1
#define kGameSizeMedium 2
#define kGameSizeLarge 3

@interface HDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic) long settingSpots;
@property (nonatomic) float settingDistance;

@end
