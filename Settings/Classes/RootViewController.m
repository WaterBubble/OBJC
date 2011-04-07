#import "RootViewController.h"

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

	UIButton * settingButton;
	settingButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	
	[settingButton setTitle:@"Setting" forState:UIControlStateNormal];
	[settingButton sizeToFit];
	CGPoint newPoint = self.view.center;
	newPoint.y += 80;
	settingButton.center = newPoint;
	[settingButton addTarget:self 
			   action:@selector(settingButtonDidPush) 
	 forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:settingButton];
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
#pragma mark buttonAction

- (void)settingButtonDidPush {
	LOG_METHOD;
	
	SettingViewController * settingViewController;
	settingViewController = [[[SettingViewController alloc] init] autorelease];
	settingViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    settingViewController.delegate = self;
	
    UINavigationController * navController;
    navController = [[UINavigationController alloc] initWithRootViewController:settingViewController];
	navController.modalPresentationStyle = UIModalPresentationFormSheet;
	
	[self presentModalViewController:navController animated:YES];
	[navController release];
}

#pragma mark -
#pragma mark Delegate

- (void)cancelButtonDidPush:(id)controller
{
	LOG_METHOD;
	
    [controller dismissModalViewControllerAnimated:YES];
}

- (void)saveButtonDidPush:(id)controller
{
	LOG_METHOD;
	
    [controller dismissModalViewControllerAnimated:YES];
}




@end
