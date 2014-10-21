//
//  HDAppDelegate.h
//  hoopdreams
//
//  Created by Walid Owais on 10/20/14.
//  Copyright (c) 2014 CS378Group6. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HDDataModel.h"

@interface HDAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) HDDataModel *dataModel;

@end
