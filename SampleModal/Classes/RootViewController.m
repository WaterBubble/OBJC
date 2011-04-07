#import "RootViewController.h"
#import "ModalViewController.h"

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
	
	_countLabel = [[UILabel alloc] initWithFrame:CGRectMake(0,0,40,18)];
	_countLabel.textColor = [UIColor whiteColor];
	_countLabel.backgroundColor = [[UIColor alloc]initWithRed:0.0 green:0.0 blue:0.0 alpha:0.8];
	
	_countLabel.font = [UIFont fontWithName:@"AppleGothic" size:12];
	_countLabel.text = @"0";
	_countLabel.textAlignment = UITextAlignmentCenter;
	_countLabel.adjustsFontSizeToFitWidth = YES;
	
	[self.view addSubview:_countLabel];
	[_countLabel release];	
	
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
	
	ModalViewController * modal = [[[ModalViewController alloc] init] autorelease];
	modal.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    modal.delegate = self;
	
	[self presentModalViewController:modal animated:YES];
}

#pragma mark -
#pragma mark ModalViewControllerDelegate

- (void)modalViewControllerDidClose:(ModalViewController*)controller
{
	LOG_METHOD;

	[self updateCount];
    // コントローラを隠す
    [controller dismissModalViewControllerAnimated:YES];
}

-(void)updateCount {
	LOG_METHOD;
	_count++;
	[_countLabel setText:[NSString stringWithFormat:@"%d",_count]];
}

@end
