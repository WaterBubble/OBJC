#import <UIKit/UIKit.h>

@class PracticeTwitterViewController;

@interface PracticeTwitterAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    PracticeTwitterViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet PracticeTwitterViewController *viewController;

@end

