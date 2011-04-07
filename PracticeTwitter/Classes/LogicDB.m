#import "LogicDB.h"

@implementation LogicDB

@synthesize databaseFilename  = databaseFilename_;
@synthesize databasePathInDoc = databasePathInDoc_;

-(id)initWithDatabaseFilename:(NSString*)databaseFilename {
	self = [super init];
	
	if (self != nil) {
		[self setDatabaseFilename:databaseFilename];
		
		if( ! [self isExistsDatabaseInDoc] ) {
			[self createDatabaseFileInDoc];
		}

		[self setDatabasePathInDoc:[self getDatabasePath]];
	}
	
	return self;
}

-(FMDatabase*)getDB {
	FMDatabase* db = [FMDatabase databaseWithPath:[self databasePathInDoc]];
	if (![db open]) {
        NSLog(@"Could not open db.");
    }
	return db;
}

-(void)clearAccount {
	[self updateAccountWithUserId:nil withPassword:nil];
}

-(void)updateAccountWithUserId:(NSString*)userId{}

-(void)updateAccountWithUserId:(NSString*)userId 
				  withPassword:(NSString*)password {
	FMDatabase* db = [self getDB];	
	[db executeUpdate:@"update account set userId = ?, password = ? where recordId = 1" , userId, password];
}

-(AccountModel*)lookupAccount {
	
	FMDatabase* db  = [self getDB];
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

-(void)test {
	
	NSLog(@"test");
	
	@try {
		AccountModel* account = [AccountModel lookupByRecordId:[NSNumber numberWithInt:1]];
		NSLog(@"%@", account);

		NSLog(@"%@", account.userId);
		NSLog(@"%@", account.password);
		
		[self updateAccountWithUserId:@"hoge" withPassword:@"fuga"];

		NSLog(@"%@", account.userId);
		NSLog(@"%@", account.password);

		[self clearAccount];

		NSLog(@"%@", account.userId);
		NSLog(@"%@", account.password);
		
//		[self dbClose];
//		[self lookupAccount:1];

	} @catch (DBException* ex) {
		// DB Openエラーの処理を記述
		NSLog(@"%@ %@(%@)", [ex name], [ex message], [ex method]);
		// DBExceptionじゃない場合は、次のcatch節で処理されます。

	} @finally {
		// 必要なら実装
	}

}


-(NSString*)getOriginalDatabasePath {
	NSLog(@"getOriginalDatabasePath");

	NSString *originalDatabasePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:[self databaseFilename]];
		
	return originalDatabasePath;
}

-(NSString*)getDocPath {
	NSLog(@"getDocPath");
	NSString* docPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
															 NSUserDomainMask, 
															 YES) objectAtIndex:0];
	return docPath;
}

-(NSString*)getDatabasePath {
	NSLog(@"getDatabasePath");
	
	NSString* databasePath = [NSString stringWithFormat:@"%@/%@", [self getDocPath], [self databaseFilename]];
	
	return databasePath;
}

-(BOOL)isExistsDatabaseInDoc {
	NSLog(@"isExistsDatabaseInDoc");
	NSFileManager* manager = [NSFileManager defaultManager];
	
	NSLog(@"%@", [self getDatabasePath]);

	if ( [manager fileExistsAtPath:[self getDatabasePath]] ) {
		NSLog(@"db is exists");
		return TRUE;
	}
	else {
		NSLog(@"db is NOT exists");
		return FALSE;
	}
}

-(void)createDatabaseFileInDoc {
	NSLog(@"createDatabaseFileInDoc");
	
	NSError* error = nil;
	NSFileManager* manager = [NSFileManager defaultManager];
	
	if (![manager copyItemAtPath:[self getOriginalDatabasePath] toPath:[self getDatabasePath] error:&error])
	{		
		DBException* exception =
		[DBException exceptionWithCode:DB_OPEN_ERROR
								  Name:@"DB Error"
								Method:[NSString stringWithFormat:@"%@/%@",
										NSStringFromClass([self class]),
										NSStringFromSelector(_cmd)]];
		@throw exception;
	}        

}

-(void)dbBegin {
	NSLog(@"DB Transaction start");
//	sqlite3_exec(db_, "BEGIN", NULL, NULL, NULL );
}

-(void)dbCommit {
	NSLog(@"DB Commit");
//	sqlite3_exec(db_, "COMMIT", NULL, NULL, NULL );
}

-(void)dbRollback {
	NSLog(@"DB Rollback");
//	sqlite3_exec(db_, "ROLLBACK", NULL, NULL, NULL );
}

@end

