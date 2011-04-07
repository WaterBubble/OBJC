#import <UIKit/UIKit.h>
#import "RootViewController.h"

@interface ModalViewController : UIViewController {
    RootViewController * _delegate; // Assign
}

@property (nonatomic, assign) id delegate;

@end
