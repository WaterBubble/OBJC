    //
//  SettingViewController.m
//  Settings
//
//  Created by masao okamura on 11/04/06.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "SettingViewController.h"


@implementation SettingViewController

@synthesize delegate = _delegate;

- (void)loadView {
	LOG_METHOD;
	
	[super loadView];
}

- (void)viewDidLoad {
	LOG_METHOD;
	
    [super viewDidLoad];
	
	UIBarButtonItem * cancelButtonItem;
	cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
													 target:self
													 action:@selector(cancelButtonDidPush)];
	
	UIBarButtonItem * saveButtonItem;
	saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
													 target:self
													 action:@selector(saveButtonDidPush)];
	
	self.navigationItem.leftBarButtonItem  = cancelButtonItem;
	self.navigationItem.rightBarButtonItem = saveButtonItem;
	self.navigationItem.title = @"Settings";
	
	UITextField * textField;
	textField = [[UITextField alloc] init];
	textField.frame = CGRectMake( 20, 20, 280, 30 );
	textField.borderStyle = UITextBorderStyleRoundedRect;
	textField.text = @"ここをタップすると入力できます";
	
	[self.view addSubview:textField];
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

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
	_delegate = nil;
	
    [super dealloc];
}

#pragma mark -
#pragma mark buttonAction

- (void)cancelButtonDidPush {
	LOG_METHOD;
	if ([_delegate respondsToSelector:@selector(cancelButtonDidPush:)]) {
        [_delegate cancelButtonDidPush:self];
    }
}

- (void)saveButtonDidPush {
	LOG_METHOD;
	if ([_delegate respondsToSelector:@selector(saveButtonDidPush:)]) {
        [_delegate saveButtonDidPush:self];
    }
}

@end
