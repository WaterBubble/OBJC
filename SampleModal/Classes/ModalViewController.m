#import "ModalViewController.h"


@implementation ModalViewController

@synthesize delegate = _delegate;

- (void)loadView {
	LOG_METHOD;

	[super loadView];
}

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
	LOG_METHOD;
	
    [super viewDidLoad];
	
	UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
	label.backgroundColor = [UIColor blackColor];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = UITextAlignmentCenter;
	label.text = @"I am modal!!";
	[self.view addSubview:label];
	
	UIButton* closeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[closeButton setTitle:@"Close" forState:UIControlStateNormal];
	[closeButton sizeToFit];
	CGPoint newPoint = self.view.center;
	newPoint.y += 80;
	closeButton.center = newPoint;
	[closeButton addTarget:self
					  action:@selector(closeDidPush)
			forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:closeButton];
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

	_delegate = nil;
    [super dealloc];
}

- (void)closeDidPush {
	LOG_METHOD;

	if ([_delegate respondsToSelector:@selector(modalViewControllerDidClose:)]) {
        [_delegate modalViewControllerDidClose:self];
    }
}


@end
