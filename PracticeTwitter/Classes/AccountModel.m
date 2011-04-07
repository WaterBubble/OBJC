#import "AccountModel.h"
#import "LogicDB.h"
#import "FMDatabase.h"
#import "FMDatabaseAdditions.h"

@implementation AccountModel

@synthesize userId, password;

+(AccountModel*)lookupByRecordId:(NSNumber*)recordId {

	LogicDB * logicDB = [[[LogicDB alloc ] initWithDatabaseFilename:@"sqlite3.db"] autorelease];
	FMDatabase* db  = [logicDB getDB];
	FMResultSet* rs = [db executeQuery:@"select * from account limit 1;"];
	
	AccountModel* account = [[[AccountModel alloc] init] autorelease];
	
	if ([rs next]) {	
		account.userId   = [rs stringForColumn:@"userId"];
		account.password = [rs stringForColumn:@"password"];
	}
	else {
		// XXX: 例外処理
	}
	
	[rs close];
	[db close];	
	
	return account;

}

-(id) init {
    [super init];
    return self;
}

- (void)dealloc {
    [userId release];
    [password release];
    [super dealloc];
}

@end