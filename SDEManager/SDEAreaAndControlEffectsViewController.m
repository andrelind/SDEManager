#import "SDEAreaAndControlEffectsViewController.h"
#import "SDEAttribute.h"
#import "SDEAreaOrControlEffectViewController.h"

@interface SDEAreaAndControlEffectsViewController ()

@property (nonatomic, weak) IBOutlet UISegmentedControl* segmentedControl;

@property (nonatomic, retain) NSArray* areaEffects;
@property (nonatomic, retain) NSArray* controlEffects;
@property (nonatomic, retain) NSArray* distanceEffects;

@end

@implementation SDEAreaAndControlEffectsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.areaEffects = [SDEAttribute MR_findByAttribute:@"type" withValue:@(SDEAttributeTypeAreaEffect) andOrderBy:@"title" ascending:YES];
	self.controlEffects = [SDEAttribute MR_findByAttribute:@"type" withValue:@(SDEAttributeTypeControlEffect) andOrderBy:@"title" ascending:YES];
	self.distanceEffects = [SDEAttribute MR_findByAttribute:@"type" withValue:@(SDEAttributeTypeDistanceEffect) andOrderBy:@"title" ascending:YES];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	if(self.segmentedControl.selectedSegmentIndex == 0)
		return self.areaEffects.count;
	else if(self.segmentedControl.selectedSegmentIndex == 1)
		return self.controlEffects.count;
	return self.distanceEffects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"EffectCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
	
	SDEAttribute* effect = nil;
	if(self.segmentedControl.selectedSegmentIndex == 0)
		effect = self.areaEffects[indexPath.row];
	else if(self.segmentedControl.selectedSegmentIndex == 1)
		effect = self.controlEffects[indexPath.row];
	else
		effect = self.distanceEffects[indexPath.row];
	
	cell.textLabel.text = effect.title;
	cell.textLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:15];
    
    return cell;
}

- (IBAction)segmentedControlChangedValue:(id)sender {
	[self.tableView reloadData];
}


#pragma mark - Navigation

// In a story board-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	SDEAreaOrControlEffectViewController* effectView = segue.destinationViewController;
	
	if(self.segmentedControl.selectedSegmentIndex == 0)
		effectView.effect = self.areaEffects[self.tableView.indexPathForSelectedRow.row];
	else if(self.segmentedControl.selectedSegmentIndex == 1)
		effectView.effect = self.controlEffects[self.tableView.indexPathForSelectedRow.row];
	else
		effectView.effect = self.distanceEffects[self.tableView.indexPathForSelectedRow.row];
}

@end
