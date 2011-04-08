#import "ValidationViewController.h"

@implementation ValidationViewController

@synthesize delegate = _delegate;

- (void)loadView {
	LOG_METHOD;
	[super loadView];
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	UIBarButtonItem * backButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"戻る" 
																		style:UIBarButtonItemStylePlain
																	   target:self
																	   action:@selector(backDidPush)];
	
	self.navigationItem.leftBarButtonItem = backButtonItem;
	
	UILabel * label;
	label = [[UILabel alloc] init];
	label.frame = CGRectMake( 20, 20, 280, 30 );
	label.textAlignment = UITextAlignmentCenter;
	label.text = @"4文字以上、6文字以内で入力してください。";
	label.adjustsFontSizeToFitWidth = YES;	
	label.textColor = [UIColor blackColor];
	
	[self.view addSubview:label];
	[label release];
	
	UITextField * textField;
	textField = [[UITextField alloc] init];
	textField.frame = CGRectMake( 20, 100, 280, 30 );
	textField.borderStyle = UITextBorderStyleRoundedRect;
	textField.placeholder = @"IDを入力した下さい。";
	textField.delegate = self;
	[textField addTarget:self 
				  action:@selector(textFieldEditingChanged:)
		forControlEvents:UIControlEventEditingChanged];
	
	[self.view addSubview:textField];
	[textField release];
	
	_button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[_button setTitle:@"Submit" forState:UIControlStateNormal];
	[_button sizeToFit];
	CGPoint newPoint = self.view.center;
	newPoint.y -= 80;
	_button.center = newPoint;
	_button.enabled = NO;
	[_button setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
	[self.view addSubview:_button];
	
}

- (void)viewDidLoad {
	LOG_METHOD;	
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
	LOG_METHOD;
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	LOG_METHOD;
    [super viewDidUnload];
}


- (void)dealloc {
	LOG_METHOD;

	_delegate = nil;
	[_button release];
    [super dealloc];
}

- (void)backDidPush {
	LOG_METHOD;

	if ([_delegate respondsToSelector:@selector(modalViewControllerDidClose:)]) {
        [_delegate modalViewControllerDidClose:self];
    }
}

- (void)textFieldEditingChanged:(UITextField*)textField {
	LOG_METHOD;

	LOG(@"%@", textField);
	NSRange match = [textField.text rangeOfString:@"^[a-zA-Z0-9]{4,6}$" options:NSRegularExpressionSearch];
	if (match.location != NSNotFound) {
		NSLog(@"Found: %@",[textField.text substringWithRange:match]);
		_button.enabled = YES;
	} else {
		NSLog(@"Not Found");
		_button.enabled = NO;
	}
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	LOG_METHOD;
	
    // キーボードを隠す
    [textField resignFirstResponder];
    return YES;
}

#pragma mark -
#pragma mark Validation

@end


