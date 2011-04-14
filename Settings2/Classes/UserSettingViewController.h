#import <UIKit/UIKit.h>

@interface UserSettingViewController : UITableViewController <UITextFieldDelegate> {
    id _delegate; // Assign
	UITextField *_usernameField;
    UITextField *_passwordField;
}

@property (nonatomic, assign) id delegate;

@end
