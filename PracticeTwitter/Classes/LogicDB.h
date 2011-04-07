#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import "FMDatabase.h"
#import "DBException.h"
#import "AccountModel.h"

@interface LogicDB : NSObject {
//    sqlite3* db_;
	FMDatabase* db_;// = [FMDatabase databaseWithPath:@"/tmp/tmp.db"];
    sqlite3_stmt* statementInsert_;
	NSString* databaseFilename_;	
	NSString* databasePathInDoc_;	
}

@property (nonatomic, retain) NSString *databaseFilename;
@property (nonatomic, retain) NSString *databasePathInDoc;

-(void)test;
-(FMDatabase*)getDB;
//-(AccountModel*)lookupAccount;
-(id)initWithDatabaseFilename:(NSString*)databaseFilename;
-(void)updateAccountWithUserId:(NSString*)userId 
				  withPassword:(NSString*)password;
-(NSString*)getOriginalDatabasePath;
-(NSString*)getDocPath;
-(NSString*)getDatabasePath;
-(BOOL)isExistsDatabaseInDoc;
//-(void)dbOpen;
//-(void)dbClose;
-(void)updateAccountWithUserId;
-(void)createDatabaseFileInDoc;
-(void)clearAccount;
-(void)dbBegin;
-(void)dbCommit;
-(void)dbRollback;
//-(void)userInfoSelect;
//-(void)userInfoDeleteAll;
//-(void)userInfoInsert:(UserInfo*)userInfo;
//-(void)prepareInsertSQL;
//-(void)finalizeInsertSQL;
//-(NSNumber*)getNumber:(sqlite3_stmt*)statement column:(int)col;
//-(NSString*)getString:(sqlite3_stmt*)statement column:(int)col;

@end

