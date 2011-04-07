//
//  TestFMDBAppDelegate.h
//  TestFMDB
//
//  Created by masao okamura on 11/03/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class TestFMDBViewController;

@interface TestFMDBAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestFMDBViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestFMDBViewController *viewController;

@end

