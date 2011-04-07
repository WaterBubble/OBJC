    //
//  BasicViewController.m
//  PracticeUIKit
//
//  Created by okamura on 11/03/05.
//  Copyright 2011 free. All rights reserved.
//

#import "BasicViewController.h"


@implementation BasicViewController

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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	
	UILabel* label = [[[UILabel alloc] initWithFrame:CGRectZero] autorelease];
	
	label.backgroundColor = [UIColor whiteColor];
	label.textColor = [UIColor blackColor];
	label.frame = CGRectMake(0,0,200,50);
	label.center = CGPointMake(160, 240);

	label.text = @"UILabel";
	label.textAlignment = UITextAlignmentCenter;

	NSLog(@"x = %f", label.frame.origin.x );
	NSLog(@"y = %f", label.frame.origin.y );
	NSLog(@"width = %f", label.frame.size.width);
	NSLog(@"height = %f", label.frame.size.height);
	
	NSLog( @"x = %f", label.center.x );
	NSLog( @"y = %f", label.center.y );
	
	[self.view addSubview:label];
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
