#import "LastViewController.h"

@implementation LastViewController

- (id)init {
	LOG_METHOD;
	
	if ( (self = [super init]) ) {
		
		self.title = @"Last World";
		
	}
	return self;
}

- (void)viewDidLoad {
	LOG_METHOD;
	
	[super viewDidLoad];
	
	UILabel* label = [[UILabel alloc] initWithFrame:self.view.bounds];
	label.text = @"Hello, last world!";
	label.textAlignment = UITextAlignmentCenter;
	label.backgroundColor = [UIColor whiteColor];
	label.textColor = [UIColor blackColor];
	label.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
	[self.view addSubview:label];
	
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