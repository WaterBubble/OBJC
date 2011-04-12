#import "RootViewController.h"
#import "ImageViewerViewController.h"
#import "MyPhoto.h"

@implementation RootViewController

#pragma mark -
#pragma mark Initialize

- (id)init {
	LOG_METHOD;
	
	if ( (self = [super init]) ) {		
	}
	return self;
}

// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
	LOG_METHOD;
	[super loadView];
	
	ImageViewerViewController * viewer;
	viewer = [[ImageViewerViewController alloc] init];
	
	[self.view addSubview:viewer.view];
}

- (void)viewDidLoad {
	LOG_METHOD;
	
	[super viewDidLoad];

}

- (void)didReceiveMemoryWarning {
	LOG_METHOD;
	
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	LOG_METHOD;
	
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
	LOG_METHOD;
	
    [super dealloc];
}

@end
