#import "SqliteDB.h"

@implementation SqliteDB

-(void) initializeDatabaseIfNeeded {
	NSLog(@"initializeDatabaseIfNeeded");
	
    NSFileManager* fileManager = [NSFileManager defaultManager];
    NSError* error;
    
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDir = [paths objectAtIndex:0];
    NSString* flagPath = [documentsDir stringByAppendingPathComponent:DBFLAG];
	
	NSLog(@"%@", flagPath);
	
    // dbflag file check
    if (![fileManager fileExistsAtPath:flagPath]) {
        NSString* dbpath = [SqliteDB getDatabaseFilePath];
		
		NSLog(@"%@", dbpath);
        NSString* templateDBPath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:BASEDB];
        
        // remove database file
        if([fileManager fileExistsAtPath:dbpath] == YES) {
            [fileManager removeItemAtPath:dbpath error:NULL];
        }
        
        // copy database file
        if (![fileManager copyItemAtPath:templateDBPath toPath:dbpath error:&error]) {
            [error localizedDescription];
            return;
        }
        
        // dbflag file create
        [fileManager createFileAtPath:flagPath contents:nil attributes:nil];
    }
	
}

+(NSString*) getDatabaseFilePath {
	NSLog(@"getDatabaseFilePath");

    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString* documentsDir = [paths objectAtIndex:0];
    return [documentsDir stringByAppendingPathComponent:DBPATH];
}


- (void)dealloc {
    [super dealloc];
}

@end