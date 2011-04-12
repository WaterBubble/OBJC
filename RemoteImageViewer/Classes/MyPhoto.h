#import <Foundation/Foundation.h>
@class MyPhoto;

// Delegate
@protocol MyPhotoDelegate <NSObject>
- (void)photoDidFinishLoading:(MyPhoto *)photo;
- (void)photoDidFailToLoad:(MyPhoto *)photo;
@end

@interface MyPhoto : NSObject {
	NSURL    *_photoURL;
	UIImage  *_photoImage;	
	BOOL      _workingInBackground;
}

+ (MyPhoto *)photoWithURL:(NSURL *)url;
- (id)initWithURL:(NSURL *)url;

// Public methods
- (BOOL)isImageAvailable;
- (UIImage *)image;
- (UIImage *)obtainImage;
- (void)obtainImageInBackgroundAndNotify:(id <MyPhotoDelegate>)notifyDelegate;
- (void)releasePhoto;


@end
