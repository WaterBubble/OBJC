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
		
	UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"戻る" 
													   style:UIBarButtonItemStylePlain
													  target:self
													  action:@selector(backDidPush)];
	
	self.navigationItem.leftBarButtonItem = backButtonItem;
	
	UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
	label.backgroundColor = [UIColor blackColor];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = UITextAlignmentCenter;
	label.text = @"I am modal!!";
	[self.view addSubview:label];
	
	UIWebView * webView;
	webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
	
	[self.view addSubview:webView];
	
	NSURLRequest * request;
	request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]];
	
	[webView loadRequest:request];

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

- (void)backDidPush {
	LOG_METHOD;

	if ([_delegate respondsToSelector:@selector(modalViewControllerDidClose:)]) {
        [_delegate modalViewControllerDidClose:self];
    }
}

- (void)_updateNavigationBar {
	
}

@end
