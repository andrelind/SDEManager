#import "SDEItemListViewController.h"
#import "SDEItem.h"

@interface SDEItemListViewController ()
@property (nonatomic, retain) NSArray* list;
@property (nonatomic, retain) NSArray *filteredResult;
@end

@implementation SDEItemListViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.list = [SDEItem MR_findByAttribute:@"type" withValue:@(self.itemType) andOrderBy:@"name" ascending:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if (tableView == self.searchDisplayController.searchResultsTableView)
        return self.filteredResult.count;
    return self.list.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"ItemCell";
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
	if (tableView == self.searchDisplayController.searchResultsTableView) {
        cell.textLabel.text = [self.filteredResult[indexPath.row] name];
    } else {
        cell.textLabel.text = [self.list[indexPath.row] name];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	if (tableView == self.searchDisplayController.searchResultsTableView)
		[self.itemControllerDelegate itemListController:self didSelectItem:self.filteredResult[indexPath.row]];
	else
		[self.itemControllerDelegate itemListController:self didSelectItem:self.list[indexPath.row]];
}

#pragma mark - UISearchController

- (void)filterContentForSearchText:(NSString*)searchText scope:(NSString*)scope {
    NSPredicate *resultPredicate = [NSPredicate
                                    predicateWithFormat:@"name contains[cd] %@",
                                    searchText];
    
    self.filteredResult = [self.list filteredArrayUsingPredicate:resultPredicate];
}

-(BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString {
    [self filterContentForSearchText:searchString
                               scope:[self.searchDisplayController.searchBar scopeButtonTitles][self.searchDisplayController.searchBar.selectedScopeButtonIndex]];
    return YES;
}


@end
