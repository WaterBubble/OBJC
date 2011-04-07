#import <Foundation/Foundation.h>


@interface AccountModel : NSObject {
	NSString * _identifier;
	NSString * _password;
}

@property (nonatomic, retain) NSString * identifier;
@property (nonatomic, retain) NSString * password;

-(void)encodeWithCoder:(NSCoder *)encoder;

@end
