#import <UIKit/UIKit.h>


@interface UserSettingListViewController : UITableViewController {
    id _delegate; // Assign
	NSArray* _items;  // 表示アイテムの配列
}
@property (nonatomic, assign) id delegate;

@end
