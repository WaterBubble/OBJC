#import <sqlite3.h>
#import "FMDatabase.h"

#define BASEDB @"sqlite3.db"
#define DBPATH @"sqlite3.db"
#define DBFLAG @"dbflag"

@interface SqliteDB : NSObject {    
}

-(void) initializeDatabaseIfNeeded;

+(NSString*) getDatabaseFilePath;

@end
