#import "NextViewController.h"
#import "LastViewController.h"

@implementation NextViewController

- (id)init {
	LOG_METHOD;
	
	if ( (self = [super init]) ) {

		self.title = @"Next World";

	}
	return self;
}

- (void)viewDidLoad {
	LOG_METHOD;

	[super viewDidLoad];

	UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = @"Hello, next world!";
	label.textAlignment = UITextAlignmentCenter;
	label.backgroundColor = [UIColor whiteColor];
	label.textColor = [UIColor blackColor];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:label];
	
	UIButton * button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[button setTitle:@"Push Me" forState:UIControlStateNormal];
	[button sizeToFit];
	CGPoint newPoint = self.view.center;
	newPoint.y += 80;
	button.center = newPoint;
	[button addTarget:self 
			   action:@selector(buttonDidPush) 
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

- (void)buttonDidPush {
	LOG_METHOD;
	
	LastViewController * lastViewController = [[[LastViewController alloc] init] autorelease];
	[self.navigationController pushViewController:lastViewController 
										 animated:YES];
}

@end