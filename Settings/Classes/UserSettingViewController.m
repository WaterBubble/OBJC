#import "UserSettingViewController.h"

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
		
        UITextField *textField = [[[UITextField alloc] initWithFrame:CGRectMake(110, 10, 150, 30)] autorelease];
        textField.returnKeyType = UIReturnKeyDone; // ReturnキーをDoneに変える
        textField.delegate = self;
        textField.tag = [indexPath row];
        
        // ユーザが既に設定済みであればその情報を表示する
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
		
        if ([indexPath row] == 0) {
            label.text = @"Username";
            textField.text = [defaults objectForKey:@"USERNAME"];
        } else if ([indexPath row] == 1) {
            label.text = @"Password";
            textField.secureTextEntry = YES;    // パスワードを画面に表示しないようにする
            textField.text = [defaults objectForKey:@"PASSWORD"];
        }
		
        [cell.contentView addSubview:label];
        [cell.contentView addSubview:textField];
    }
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	LOG_METHOD;
	
	if(section == 0) {
		return @"Your Account";
	}
	
	return "XXX";
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
		
	if ([_delegate respondsToSelector:@selector(saveButtonDidPush:)]) {
        [_delegate saveButtonDidPush:self];
    }
}


#pragma mark -
#pragma mark UITextFieldDelegate

- (void)textFieldDidEndEditing:(UITextField *)textField {
    // 入力された情報をセーブする
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	
    if (textField.tag == 0) {
        [defaults setObject:textField.text forKey:@"USERNAME"];
    } else if (textField.tag == 1) {
        [defaults setObject:textField.text forKey:@"PASSWORD"];
    }
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    // キーボードを隠す
    [textField resignFirstResponder];
    return YES;
}

@end

