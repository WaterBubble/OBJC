    //
//  ToggleViewController.m
//  PracticeUIKit
//
//  Created by okamura on 11/03/05.
//  Copyright 2011 free. All rights reserved.
//

#import "ToggleViewController.h"


@implementation ToggleViewController

// The designated initializer.  Override if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
/*
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization.
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor blackColor];
	
	_label = [[UILabel alloc] initWithFrame:CGRectMake( 0, 0, 320, 200 )];
	_label.textAlignment = UITextAlignmentCenter;
	_label.backgroundColor = [UIColor blackColor];
	_label.textColor = [UIColor whiteColor];
	_label.text = @"Hi!! I am UILabel extends UIView";
	_label.hidden = YES;
	
	[self.view addSubview:_label];
	
	UIButton* button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake( 0, 0, 100, 40 );
	CGPoint newPoint = self.view.center;
	newPoint.y = self.view.frame.size.height - 70;
	button.center = newPoint;
	[button setTitle:@"Toggle" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
	
	[self.view addSubview:button];
}

- (void)buttonDidPush {
	_label.hidden = !_label.hidden;
}

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}


@end
