#import <UIKit/UIKit.h>
#import "ValidationViewController.h"

@interface ValidationViewController : UIViewController <UITextFieldDelegate> {
	UIButton * _button;
    RootViewController * _delegate; // Assign
}

@property (nonatomic, assign) id delegate;

@end
