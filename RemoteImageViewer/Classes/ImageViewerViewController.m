#import "ImageViewerViewController.h"
#import "MyPhoto.h"

@implementation ImageViewerViewController

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	LOG_METHOD;
	[super loadView];

	// Setup photo frame
	_photo = [MyPhoto photoWithURL:[NSURL URLWithString:@"http://farm6.static.flickr.com/5296/5425314834_535d56f8aa_b.jpg"]];
	[_photo retain];
	
	_photoImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
	_photoImageView.backgroundColor = [UIColor whiteColor];
	[self.view addSubview:_photoImageView];
	[_photoImageView retain];

	// Spinner
	_spinner = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	_spinner.hidesWhenStopped = YES;
	_spinner.center = CGPointMake(self.view.bounds.size.width / 2.0, self.view.bounds.size.height / 2.0);
	_spinner.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin |
	UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleRightMargin;
	[self.view addSubview:_spinner];	
}


- (void)viewDidLoad {
	LOG_METHOD;
    [super viewDidLoad];

	[self displayImage];	
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	LOG_METHOD;
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (void)didReceiveMemoryWarning {
	LOG_METHOD;
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	LOG_METHOD;
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
	LOG_METHOD;
	[_photo release];
	[_photoImageView release];
	[_spinner release];
    [super dealloc];
}

#pragma mark -
#pragma mark Photos

- (void)displayImage {
	LOG_METHOD;
	
	// Get image or obtain in background
	if ([_photo isImageAvailable]) {
		[_spinner stopAnimating];
		
		// Setup photo frame
		CGRect photoImageViewFrame;
		photoImageViewFrame.origin = CGPointZero;
		photoImageViewFrame.size = [_photo image].size;
		_photoImageView.frame = photoImageViewFrame;
		_photoImageView.image = [_photo image];
	} else {
		// MyPhotoに画像取得処理を委譲。取得完了通知は
		// photoDidFinishLoadingあるいはphotoDidFailToLoadへ行う。
		[_spinner startAnimating];
		[_photo obtainImageInBackgroundAndNotify:self];
	}
}

#pragma mark -
#pragma mark BKPhotoDelegate

- (void)photoDidFinishLoading:(MyPhoto *)photo {
	LOG_METHOD;
	[_spinner stopAnimating];
	[self displayImage];	
}

- (void)photoDidFailToLoad:(MyPhoto *)photo {
	LOG_METHOD;
	[_spinner stopAnimating];

	// 本来はここに失敗した場合の処理を記述する
}

@end
