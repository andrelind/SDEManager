#import "SDEStatusEffectsViewController.h"
#import "SDEAttribute.h"
#import "SDEStatusEffectDetailView.h"

@interface SDEStatusEffectsViewController ()
@property (nonatomic, retain) NSMutableArray* statuses;
@end

@implementation SDEStatusEffectsViewController

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.excludedStatuses = [NSMutableSet set];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.statuses = [NSMutableArray arrayWithArray:[SDEAttribute MR_findAllSortedBy:@"title" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"type == %i", SDEAttributeTypeStatusEffect]]];
	[self.statuses removeObjectsInArray:self.excludedStatuses.allObjects];
	[self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [SDEAttribute MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"type == %i", SDEAttributeTypeStatusEffect]] - self.excludedStatuses.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"StatusEffectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
	SDEAttribute* status = self.statuses[indexPath.row];
	cell.textLabel.text = status.title;
	cell.textLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:15];
	
	cell.imageView.image = [UIImage imageNamed:status.title];
	cell.imageView.layer.cornerRadius = 22.5f;
    
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	SDEAttribute* statusEffect = self.statuses[indexPath.row];
	[self.statusEffectDelegate statusEffectsViewController:self didSelectStatusEffect:statusEffect];
	
	[self.excludedStatuses addObject:statusEffect];
	[self.statuses removeObject:statusEffect];
	[self.tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([segue.identifier isEqualToString:@"StatusEffectDetail"]){
		UITableViewCell* cell = sender;
		NSIndexPath* indexPath = [self.tableView indexPathForCell:cell];
		((SDEStatusEffectDetailView*)segue.destinationViewController).statusEffect = self.statuses[indexPath.row];
	}
}

@end
