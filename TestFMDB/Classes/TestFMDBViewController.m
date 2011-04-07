//
//  TestFMDBViewController.m
//  TestFMDB
//
//  Created by masao okamura on 11/03/08.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "TestFMDBViewController.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

#define FMDBQuickCheck(SomeBool) { if (!(SomeBool)) { NSLog(@"Failure on line %d", __LINE__); } }

@implementation TestFMDBViewController



/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

	NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
	
	// delete the old db.
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager removeItemAtPath:@"/tmp/tmp.db" error:nil];
    
    FMDatabase* db = [FMDatabase databaseWithPath:@"/tmp/tmp.db"];
    if (![db open]) {
        NSLog(@"Could not open db.");
        [pool release];
    }
	
	// kind of experimentalish.
    [db setShouldCacheStatements:YES];
    
    // create a bad statement, just to test the error code.
    [db executeUpdate:@"blah blah blah"];
    
	FMDBQuickCheck([db hadError]);
	
    if ([db hadError]) {
        NSLog(@"Err %d: %@", [db lastErrorCode], [db lastErrorMessage]);
    }
	
	NSError *err = 0x00;
    FMDBQuickCheck(![db update:@"blah blah blah" error:&err bind:nil]);
    FMDBQuickCheck(err != nil);
    FMDBQuickCheck([err code] == SQLITE_ERROR);
    NSLog(@"err: '%@'", err);
    
    // but of course, I don't bother checking the error codes below.
    // Bad programmer, no cookie.
    
    [db executeUpdate:@"create table test (a text, b text, c integer, d double, e double)"];
}



/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
	// Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
	
	// Release any cached data, images, etc that aren't in use.
}

- (void)viewDidUnload {
	// Release any retained subviews of the main view.
	// e.g. self.myOutlet = nil;
}


- (void)dealloc {
    [super dealloc];
}

@end
