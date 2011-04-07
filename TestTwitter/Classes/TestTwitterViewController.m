#import "TestTwitterViewController.h"
#import "OAuthConsumer.h"

@implementation TestTwitterViewController

static NSString *kConsumerKey       = @"xx";
static NSString *kConsumerSecret    = @"xx";
static NSString *kAccessToken       = @"xx";
static NSString *kAccessTokenSecret = @"xx";

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

	[self tweet:@"msg"];
}


- (void)tweet:(NSString *)message {
    NSURL *url = [NSURL URLWithString:@"http://twitter.com/statuses/update.json"];
    OAConsumer *consumer =
	[[[OAConsumer alloc] initWithKey:kConsumerKey
							  secret:kConsumerSecret] autorelease];
    OAToken *accessToken =
	[[[OAToken alloc] initWithKey:kAccessToken
						   secret:kAccessTokenSecret] autorelease];
    OAMutableURLRequest *request = [[[OAMutableURLRequest alloc] initWithURL:url
                                                                    consumer:consumer
                                                                       token:accessToken
                                                                       realm:nil
                                                           signatureProvider:nil] autorelease];
    [request setHTTPMethod:@"POST"];
    NSString *bodyString = [NSString stringWithFormat:@"status=%@",
							(NSString *)CFURLCreateStringByAddingPercentEscapes(  
																				kCFAllocatorDefault,
																				(CFStringRef)message,
																				NULL,
																				NULL,
																				kCFStringEncodingUTF8)];
    [request setHTTPBody:[bodyString dataUsingEncoding:NSUTF8StringEncoding]];
	
    OADataFetcher *fetcher = [[[OADataFetcher alloc] init] autorelease];
    [fetcher fetchDataWithRequest:request
                         delegate:self
                didFinishSelector:@selector(ticket:didFinishWithData:)
                  didFailSelector:@selector(ticket:didFailWithError:)];
}

- (void)ticket:(OAServiceTicket *)ticket didFinishWithData:(NSData *)data {
    NSString *dataString = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
    NSLog(@"data: %@", dataString);
}

- (void)ticket:(OAServiceTicket *)ticket didFailWithError:(NSError *)error {
    NSLog(@"didFailWithError");
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
