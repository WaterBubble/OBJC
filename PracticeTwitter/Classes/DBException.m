#import "DBException.h"

@implementation DBException

@synthesize Code = Code_;

+(id)exceptionWithCode:(DBExceptionCode) Code
				  Name:(NSString*) Name
				Method:(NSString*) Method
{
	id exception = [[self alloc] initWithCode:(DBExceptionCode) Code
                                         Name:(NSString*) Name
                                       Method:(NSString*) Method];
    
	return exception;
}

-(id)initWithCode:(DBExceptionCode) Code
             Name:(NSString*) Name
           Method:(NSString*) Method
{
    self = [super initWithName:Name reason:nil userInfo:nil];
	if (self)
	{
		self.Code = Code;
		Method_ = Method;
	}
    
	return self;
}

-(NSString*)message {
	NSString* Message;
	switch(Code_){
		case DB_OPEN_ERROR:
			Message = NSLocalizedString(@"DBOpen", @"message");
			break;
		case DB_INSERT_ERROR:
			Message = NSLocalizedString(@"DBInsert", @"message");
			break;
		case DB_UPDATE_ERROR:
			Message = NSLocalizedString(@"DBUpdate", @"message");
			break;
		case DB_DELETE_ERROR:
			Message = NSLocalizedString(@"DBDelete", @"message");
			break;
		case DB_PREPARE_ERROR:
			Message = NSLocalizedString(@"DBPrepare", @"message");
			break;
		case DB_FINALIZE_ERROR:
			Message = NSLocalizedString(@"DBfinalyze", @"message");
			break;
		default:
			Message = @"";
			break;
	}
	return Message;
}

-(NSString*)method {
	return Method_;
}

- (void)dealloc
{
	[Method_ release];
	[super dealloc];
}

@end