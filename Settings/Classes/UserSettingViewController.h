#import <UIKit/UIKit.h>

@interface UserSettingViewController : UITableViewController <UITextFieldDelegate> {
    id _delegate; // Assign
}

@property (nonatomic, assign) id delegate;

@end
