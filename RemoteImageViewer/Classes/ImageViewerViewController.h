#import <UIKit/UIKit.h>
#import "MyPhoto.h"

@interface ImageViewerViewController : UIViewController <MyPhotoDelegate> {
	MyPhoto *_photo;
	UIImageView *_photoImageView;
	UIActivityIndicatorView *_spinner;
}

-(void)displayImage;

@end
