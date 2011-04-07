    //
//  ModalViewController.m
//  PracticeUIKit
//
//  Created by okamura on 11/03/05.
//  Copyright 2011 free. All rights reserved.
//

#import "ModalViewController.h"
#import "ModalDialogViewController.h"

@implementation ModalViewController

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
	
	self.view.backgroundColor = [UIColor whiteColor];
	
	UIButton* modalButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	[modalButton setTitle:@"call modal" forState:UIControlStateNormal];
	[modalButton sizeToFit];
	modalButton.center = self.view.center;
	[modalButton addTarget:self
					action:@selector(modalDidPush)
		  forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:modalButton];
}

- (void)modalDidPush {
	ModalDialogViewController* dialog = [[[ModalDialogViewController alloc] init] autorelease];
	dialog.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
	[self presentModalViewController:dialog animated:YES];
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
