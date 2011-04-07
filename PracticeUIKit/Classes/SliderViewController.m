    //
//  SliderViewController.m
//  PracticeUIKit
//
//  Created by okamura on 11/03/06.
//  Copyright 2011 free. All rights reserved.
//

#import "SliderViewController.h"


@implementation SliderViewController

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
	
	self.title = @"UISlider";
	self.view.backgroundColor = [UIColor whiteColor];
	
	UISlider* slider = [[[UISlider alloc] init] autorelease];
	slider.frame = CGRectMake( 0, 0, 200, 50 );
	slider.minimumValue = 0.0; 
	slider.maximumValue = 1.0; 
	slider.center = self.view.center;
	

	[slider addTarget:self
			   action:@selector(sliderDidChange:)
	 forControlEvents:UIControlEventValueChanged];
	

	_synchronizedSlider = [[UISlider alloc] init];
	_synchronizedSlider.frame = slider.frame;
	_synchronizedSlider.minimumValue = slider.minimumValue;
	_synchronizedSlider.maximumValue = slider.maximumValue;
	CGPoint point = slider.center;
	point.y += 50;
	_synchronizedSlider.center = point;
	

	[self.view addSubview:slider];
	[self.view addSubview:_synchronizedSlider];
}

- (void)sliderDidChange:(id)sender {
	if ( [sender isKindOfClass:[UISlider class]] ) {
		UISlider* slider = sender;
		_synchronizedSlider.value = slider.value;
	} 
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
	[_synchronizedSlider release];
    [super dealloc];
}


@end
