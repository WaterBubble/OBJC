    //
//  TouchesBeganViewController.m
//  PracticeUIKit
//
//  Created by okamura on 11/03/06.
//  Copyright 2011 free. All rights reserved.
//

#import "TouchesBeganViewController.h"


@implementation TouchesBeganViewController

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
}

- (void)touchesBegan:(NSSet*)touches withEvent:(UIEvent*)event {
	NSLog(@"%@", event);
	
	UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:nil
													 message:@"I'm a viewController!"
													delegate:nil
										   cancelButtonTitle:nil
										   otherButtonTitles:@"OK", nil] autorelease];
	[alert show];
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
