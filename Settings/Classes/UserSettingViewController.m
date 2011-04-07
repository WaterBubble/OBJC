#import "UserSettingViewController.h"
#import "SFHFKeychainUtils.h"

@implementation UserSettingViewController

@synthesize delegate = _delegate;

#pragma mark -
#pragma mark Initialization

- (id)initWithStyle:(UITableViewStyle)style {
	LOG_METHOD;

    // Override initWithStyle: if you create the controller programmatically and want to perform customization that is not appropriate for viewDidLoad.
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization.
    }
    return self;
}



#pragma mark -
#pragma mark View lifecycle

- (void)viewDidLoad {
	LOG_METHOD;

	[super viewDidLoad];
	
	UIBarButtonItem * cancelButtonItem;
	cancelButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel 
																	 target:self
																	 action:@selector(cancelButtonDidPush)];
	
	UIBarButtonItem * saveButtonItem;
	saveButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemSave 
																   target:self
																   action:@selector(saveButtonDidPush)];
	
	self.navigationItem.leftBarButtonItem  = cancelButtonItem;
	self.navigationItem.rightBarButtonItem = saveButtonItem;
	self.navigationItem.title = @"Settings";

}


/*
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
}
*/
/*
- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
}
*/
/*
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
}
*/
/*
- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
}
*/
/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations.
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

#pragma mark -
#pragma mark Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	LOG_METHOD;

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	LOG_METHOD;

    return 2;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	LOG_METHOD;
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
		cell.selectionStyle = UITableViewCellSelectionStyleNone;
		
        UILabel *label = [[[UILabel alloc] initWithFrame:CGRectMake(10, 6, 100, 30)] autorelease];
        label.font = [UIFont boldSystemFontOfSize:18];
		[cell.contentView addSubview:label];
		
		if ([indexPath row] == 0) {
            label.text = @"Username";
            
            _usernameField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 150, 30)];
            _usernameField.returnKeyType = UIReturnKeyDone;
            _usernameField.delegate = self;
            _usernameField.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"];
			
			// for validation
			[_usernameField addTarget:self
							   action:@selector(usernameFieldEditingChanged) 
					 forControlEvents:UIControlEventEditingChanged];
			
            [cell.contentView addSubview:_usernameField];
        } else if ([indexPath row] == 1) {
            label.text = @"Password";
            
            NSError *error;
            _passwordField = [[UITextField alloc] initWithFrame:CGRectMake(110, 10, 150, 30)];
            _passwordField.returnKeyType = UIReturnKeyDone;
            _passwordField.delegate = self;
            _passwordField.secureTextEntry = YES;
			
			// for_passwordFieldvalidation
			[_passwordField addTarget:self
							   action:@selector(passwordFieldEditingChanged) 
					 forControlEvents:UIControlEventEditingChanged];
			
            // ラッパークラスを利用してKeyChainから保存しているパスワードを取得する処理
            _passwordField.text = [SFHFKeychainUtils getPasswordForUsername:[[NSUserDefaults standardUserDefaults] objectForKey:@"USERNAME"] andServiceName:@"Test App" error:&error];
            [cell.contentView addSubview:_passwordField];
        }
		
		//[cell.contentView addSubview:label];
        //[cell.contentView addSubview:textField];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	LOG_METHOD;
	
	if(section == 0) {
		return @"Your Account";
	}
	
	return @"XXX";
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/


/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source.
        [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }   
}
*/


/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/


/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark -
#pragma mark Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	LOG_METHOD;

    // Navigation logic may go here. Create and push another view controller.
    /*
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
    [detailViewController release];
    */
}


#pragma mark -
#pragma mark Memory management

- (void)didReceiveMemoryWarning {
	LOG_METHOD;

    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Relinquish ownership any cached data, images, etc. that aren't in use.
}

- (void)viewDidUnload {
	LOG_METHOD;

    // Relinquish ownership of anything that can be recreated in viewDidLoad or on demand.
    // For example: self.myOutlet = nil;
}


- (void)dealloc {
	LOG_METHOD;

	_delegate = nil;
    [super dealloc];
}

#pragma mark -
#pragma mark buttonAction

- (void)cancelButtonDidPush {
	LOG_METHOD;
	if ([_delegate respondsToSelector:@selector(cancelButtonDidPush:)]) {
        [_delegate cancelButtonDidPush:self];
    }
}

- (void)saveButtonDidPush {
	LOG_METHOD;
	
	[self saveUserInfo];
	if ([_delegate respondsToSelector:@selector(saveButtonDidPush:)]) {
        [_delegate saveButtonDidPush:self];
    }
}

#pragma mark -
#pragma mark Action

- (void)saveUserInfo {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *oldUsername = [defaults objectForKey:@"USERNAME"];
    NSError *error;
    if (![oldUsername isEqualToString:_usernameField.text]) {
        // ユーザ名が変更になっていた場合は、古いユーザ名で保存したパスワードを削除
        [SFHFKeychainUtils deleteItemForUsername:oldUsername andServiceName:@"Test App" error:&error];
    }
    // ユーザ名はNSUserDefaultsを使って保存
    [defaults setObject:_usernameField.text forKey:@"USERNAME"];
    // ラッパークラスを利用してパスワードをKeyChainに保存
    [SFHFKeychainUtils storeUsername:_usernameField.text andPassword:_passwordField.text forServiceName:@"Test App" updateExisting:YES error:&error];
    [self.navigationItem.rightBarButtonItem setEnabled:NO];
}

#pragma mark -
#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
	LOG_METHOD;

    // Saveボタンを有効にする
    [self.navigationItem.rightBarButtonItem setEnabled:YES];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
	LOG_METHOD;

    // キーボードを隠す
    [textField resignFirstResponder];
    return YES;
}

- (void)usernameFieldEditingChanged {
	LOG_METHOD;
	LOG(@"%@", _usernameField);
	// implement validation here
}

- (void)passwordFieldEditingChanged {
	LOG_METHOD;
	LOG(@"%@", _passwordField);
	// implement validation here
}

@end

