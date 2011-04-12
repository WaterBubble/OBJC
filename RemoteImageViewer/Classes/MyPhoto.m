#import "Global.h"
#import "MyPhoto.h"

// Private
@interface MyPhoto ()

// Properties
@property (retain) UIImage *photoImage;
@property ()       BOOL     workingInBackground;

// Private Methods
- (void)doBackgroundWork:(id <MyPhotoDelegate>)delegate;

@end

@implementation MyPhoto

@synthesize photoImage = _photoImage;
@synthesize workingInBackground = _workingInBackground;

#pragma mark Class Methods

+ (MyPhoto *)photoWithURL:(NSURL *)url {
	LOG_METHOD;
	
	return [[[MyPhoto alloc] initWithURL:url] autorelease];
}

#pragma mark NSObject

- (id)initWithURL:(NSURL *)url {
	LOG_METHOD;
	
	if ((self = [super init])) {
		_photoURL = [url copy];
	}
	return self;
}

- (void)dealloc {
	LOG_METHOD;
	
	[_photoURL release];
	[_photoImage release];
	[super dealloc];
}

#pragma mark Photo

- (BOOL)isImageAvailable {
	LOG_METHOD;
	
	return (self.photoImage != nil);
}

- (UIImage *)image {
	LOG_METHOD;
	
	return self.photoImage;
}

- (UIImage *)obtainImage {
	LOG_METHOD;
	
	// 画像が表示できる状態でない場合は、表示できるようになんとかする
	if (!self.photoImage) {
		
		// Load
		UIImage *img = nil;
			
		if (_photoURL) { 
			
			LOG(@"%@", _photoURL);
			
			// Read image from URL and return
			NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:_photoURL];
			[request setValue:@"http://refer.example.com" forHTTPHeaderField:@"Referer"];
			
			NSError *error = nil;
			NSURLResponse *response = nil;
			NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
			
			//[request release];
			
			if (data) {
				img = [[UIImage alloc] initWithData:data];
			} else {
				LOG(@"Photo from URL error: %@", error);
			}
			
		}
		
		// Force the loading and caching of raw image data for speed
		//		[img decompress];		
		
		// Store
		self.photoImage = img;
		[img release];
		
	}
	
	return [[self.photoImage retain] autorelease];
}

// Release if we can get it again from path or url
- (void)releasePhoto {
	LOG_METHOD;
	
	if (self.photoImage && ( _photoURL)) {
		self.photoImage = nil;
	}
}

// Obtain image in background and notify the browser when it has loaded
- (void)obtainImageInBackgroundAndNotify:(id <MyPhotoDelegate>)delegate {
	LOG_METHOD;
	
	if (self.workingInBackground == YES) return; // Already fetching
	self.workingInBackground = YES;
	[self performSelectorInBackground:@selector(doBackgroundWork:) withObject:delegate];
}

// Run on background thread
// Download image and notify delegate
- (void)doBackgroundWork:(id <MyPhotoDelegate>)delegate {
	LOG_METHOD;
	
	NSAutoreleasePool *pool = [[NSAutoreleasePool alloc] init];
	
	// Load image
	UIImage *img = [self obtainImage];
	
	// Notify delegate of success or fail
	if (img) {
		[(NSObject *)delegate performSelectorOnMainThread:@selector(photoDidFinishLoading:) withObject:self waitUntilDone:NO];
	} else {
		[(NSObject *)delegate performSelectorOnMainThread:@selector(photoDidFailToLoad:) withObject:self waitUntilDone:NO];		
	}
	
	// Finish
	self.workingInBackground = NO;
	
	[pool release];
}

@end
