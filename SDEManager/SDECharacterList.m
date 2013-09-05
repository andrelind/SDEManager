#import "SDECharacterList.h"
#import "SDECharacter.h"
#import "SDECharacterController.h"

@interface SDECharacterList ()

@end

@implementation SDECharacterList

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.characterController = [[self.splitViewController.viewControllers lastObject] viewControllers][0];
	
	[NSNotificationCenter.defaultCenter addObserverForName:@"CharacterChangeNotification" object:nil queue:nil usingBlock:^(NSNotification *note) {
		[self.tableView reloadData];
		
		if(!self.characterController.character){
			[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
			[self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
		}
	}];
}

- (void)viewDidAppear:(BOOL)animated {
	[super viewDidAppear:animated];
	
	if([SDECharacter MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]] && !self.characterController.character){
		[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
		[self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
	}
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [SDECharacter MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]] ? 1 : 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [SDECharacter MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
	SDECharacter* character = [SDECharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]][indexPath.row];
	cell.textLabel.text = character.name;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
		[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
			SDECharacter* character = [SDECharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"] inContext:localContext][indexPath.row];
			
			if(character.shapeshift)
			   [character.shapeshift MR_deleteEntity];
			[character MR_deleteEntity];
		}];
		
		if(![SDECharacter MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]])
			[tableView deleteSections:[NSIndexSet indexSetWithIndex:0] withRowAnimation:UITableViewRowAnimationAutomatic];
		else
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
		
		if([self tableView:self.tableView numberOfRowsInSection:indexPath.section] == 0)
			self.characterController.character = nil;
		else if(!self.tableView.indexPathForSelectedRow){
			double delayInSeconds = .33;
			dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
			dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
				[self.tableView selectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionTop];
				[self tableView:self.tableView didSelectRowAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]];
			});
		}
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	self.characterController.character = [SDECharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]][indexPath.row];
}

@end
