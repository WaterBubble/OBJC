#import "LogicDB.h"

@interface AccountModel : NSObject {
	NSString* userId;
    NSString* password;
}

@property (nonatomic, readwrite, retain) NSString* userId;
@property (nonatomic, readwrite, retain) NSString* password;

+(AccountModel*)lookupByRecordId:(NSNumber*)recordId;

@end
