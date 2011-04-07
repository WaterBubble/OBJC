#import "AccountModel.h"

@implementation AccountModel

@synthesize identifier = _identifier;
@synthesize password   = _password;

-(void)encodeWithCoder:(NSCoder *)encoder {
	[encoder encodeObject:_identifier forKey:@"identifier"];
	[encoder encodeObject:_password   forKey:@"password"];
}

@end
