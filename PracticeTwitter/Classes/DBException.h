#import <Foundation/Foundation.h>
#import <Foundation/NSException.h>

typedef enum _DBExceptionCode {
	DB_OPEN_ERROR = 0,
	DB_INSERT_ERROR,
	DB_UPDATE_ERROR,
	DB_DELETE_ERROR,
	DB_SELECT_ERROR,
	DB_PREPARE_ERROR,
	DB_FINALIZE_ERROR
} DBExceptionCode;

@interface DBException : NSException {
	DBExceptionCode Code_;
	NSString* Method_;
}
@property (nonatomic) DBExceptionCode Code;

-(NSString*)message;
-(NSString*)method;

+(id)exceptionWithCode:(DBExceptionCode) Code
                  Name:(NSString*) Name
                Method:(NSString*) Method;

-(id)initWithCode:(DBExceptionCode) Code
             Name:(NSString*) Name
	       Method:(NSString*) Method;

@end