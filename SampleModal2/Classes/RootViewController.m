#import "RootViewController.h"
#import "ModalViewController.h"
#import "NavigationController.h"

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
}

- (void)viewDidLoad {
	LOG_METHOD;
	
	[super viewDidLoad];
	
	UILabel * label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = @"Hello, world!";
	label.textAlignment = UITextAlignmentCenter;
	label.backgroundColor = [UIColor whiteColor];
	label.textColor = [UIColor blackColor];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:label];
	[label release];
	
	UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Modal" forState:UIControlStateNormal];
	[button sizeToFit];
	CGPoint newPoint = self.view.center;
	newPoint.y += 80;
	button.center = newPoint;
	[button addTarget:self 
			   action:@selector(modalDidPush) 
	 forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:button];
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

#pragma mark -
#pragma mark Action

- (void)modalDidPush {
	LOG_METHOD;

	ModalViewController * modalController = [[[ModalViewController alloc] init] autorelease];
	modalController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	
    modalController.delegate = self;
	
    NavigationController * navController;
    navController = [[NavigationController alloc] initWithRootViewController:modalController];
	
	navController.modalPresentationStyle = UIModalPresentationFormSheet;
	
	[self presentModalViewController:navController animated:YES];
	[navController release];
}

#pragma mark -
#pragma mark ModalViewControllerDelegate

- (void)modalViewControllerDidClose:(ModalViewController*)controller
{
	LOG_METHOD;

    // コントローラを隠す
    [controller dismissModalViewControllerAnimated:YES];
}


@end
