#import <UIKit/UIKit.h>


@interface ModalViewController : UIViewController {
    id _delegate; // Assign
}

@property (nonatomic, assign) id delegate;

@end
