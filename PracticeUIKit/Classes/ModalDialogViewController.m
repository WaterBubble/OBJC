    //
//  ModalDaialogViewController.m
//  PracticeUIKit
//
//  Created by okamura on 11/03/05.
//  Copyright 2011 free. All rights reserved.
//

#import "ModalDialogViewController.h"


@implementation ModalDialogViewController

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
	
	UILabel* label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
	label.backgroundColor = [UIColor blackColor];
	label.textColor = [UIColor whiteColor];
	label.textAlignment = UITextAlignmentCenter;
	label.text = @"Hi, I'm Modal";
	[self.view addSubview:label];
	
	UIButton* goodbyeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[goodbyeButton setTitle:@"Good-bye" forState:UIControlStateNormal];
	[goodbyeButton sizeToFit];
	CGPoint newPoint = self.view.center;
	newPoint.y += 80;
	goodbyeButton.center = newPoint;
	[goodbyeButton addTarget:self
					  action:@selector(goodbyeDidPush)
			forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:goodbyeButton];
}

- (void)goodbyeDidPush {
	[self dismissModalViewControllerAnimated:YES];
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
