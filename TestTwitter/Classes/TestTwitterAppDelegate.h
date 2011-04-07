#import <UIKit/UIKit.h>

@class TestTwitterViewController;

@interface TestTwitterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    TestTwitterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet TestTwitterViewController *viewController;

@end

