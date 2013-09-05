#import "SDECollectionViewController.h"
#import "SDECharacterCell.h"
#import "SDECharacterBackCell.h"
#import "SDEDiceView.h"

#import "DBCharacter.h"
#import "SDEAction.h"
#import "SDEAttribute.h"
#import "SDECharacter.h"

@interface SDECollectionViewController ()
@property (nonatomic, assign) CGRect selectedCellDefaultFrame;
@property (nonatomic, assign) CGAffineTransform selectedCellDefaultTransform;

@property (nonatomic, retain) NSIndexPath *flippedIndexPath;
@property (nonatomic, retain) SDECharacterBackCell *flippedView;
@end

@implementation SDECollectionViewController

- (void)awakeFromNib {
	[super awakeFromNib];

	self.flippedView = [NSBundle.mainBundle loadNibNamed:@"SDECharacterBackCell" owner:self options:nil][0];
	if(isIpad)
		self.flippedView.frame = CGRectMake(0, 0, 300, 420);
}

#pragma mark - CollectionView Datasource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return [DBCharacter MR_countOfEntitiesWithPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
	if(self.flippedIndexPath)
		[self collectionView:collectionView shouldSelectItemAtIndexPath:self.flippedIndexPath];
	
	NSDate* start = NSDate.date;
	
    SDECharacterCell* view = [collectionView dequeueReusableCellWithReuseIdentifier:@"SDECharacterCell" forIndexPath:indexPath];
	view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"HeroCardFront"]];
	
	DBCharacter* character = [DBCharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]][indexPath.row];
	
	view.characterImageView.image = [UIImage imageNamed:character.name];
	[view setName:character.name type:character.type];
	
	[view setMovementCount:character.movementValue];
	[view setNumberOfActions:character.numberOfActionsValue];
	
	[view setNumberOfHearts:character.numberOfHeartsValue];
	[view setNumberOfPotions:character.numberOfPotionsValue];
	
	// Setup base stats
	view.attStats.blueDice = character.attBlueDiceValue;
	view.attStats.redDice = character.attRedDiceValue;
	view.attStats.greenDice = character.attGreenDiceValue;
	view.attStats.whiteDice = character.attWhiteDiceValue;

	view.armStats.blueDice = character.armBlueDiceValue;
	view.armStats.redDice = character.armRedDiceValue;
	view.armStats.greenDice = character.armGreenDiceValue;
	view.armStats.whiteDice = character.armWhiteDiceValue;

	view.willStats.blueDice = character.willBlueDiceValue;
	view.willStats.redDice = character.willRedDiceValue;
	view.willStats.greenDice = character.willGreenDiceValue;
	view.willStats.whiteDice = character.willWhiteDiceValue;

	view.dexStats.blueDice = character.dexBlueDiceValue;
	view.dexStats.redDice = character.dexRedDiceValue;
	view.dexStats.greenDice = character.dexGreenDiceValue;
	view.dexStats.whiteDice = character.dexWhiteDiceValue;
	
	// Setup Attributes
	view.attributesLabel.text = character.abilitiesText;
	
	for (SDEAction* a in character.actions)
		[view addAttributeIcon:a.token title:a.title text:a.text];
		
	NSLog(@"%f", [NSDate.date timeIntervalSinceDate:start]);
	
    return view;
}

#pragma mark - CollectionView Delegate

- (BOOL)collectionView:(UICollectionView *)collectionView shouldSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    if([self.flippedIndexPath isEqual:indexPath]){
		UICollectionViewCell *futureCell = [collectionView cellForItemAtIndexPath:indexPath];
		
		[UIView transitionFromView:self.flippedView
							toView:futureCell.contentView
						  duration:.7f
						   options:UIViewAnimationOptionTransitionFlipFromRight
						completion:^(BOOL finished) {
							[self.flippedView reset];
							self.flippedIndexPath = nil;
							[self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
						}];
        return NO;
    }
    
	return YES;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
	// Current Cell
	UICollectionViewCell *currentCell = [collectionView cellForItemAtIndexPath:indexPath];
    [currentCell.superview bringSubviewToFront:currentCell];
	self.flippedIndexPath = indexPath;
	
	[self.flippedView reset];
	
	DBCharacter* character = [DBCharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]][indexPath.row];
	
	self.flippedView.name.text = character.name.uppercaseString;
	self.flippedView.type.text = character.type.uppercaseString;
	
	NSMutableSet* attributes = [NSMutableSet setWithSet:character.abilities];
	for (SDEAction* a in character.actions)
		[attributes addObjectsFromArray:a.attributes.allObjects];
	
	for(SDEAttribute* a in [attributes sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]])
		[self.flippedView addTitle:a.title text:a.longDescription];
	
	[UIView transitionFromView:currentCell.contentView
						toView:self.flippedView
					  duration:.7f
					   options:UIViewAnimationOptionTransitionFlipFromLeft
					completion:nil];
}

#pragma mark - IBActions

- (IBAction)addCharacter:(id)sender {
	// Get indexPath of shown character
	NSIndexPath* indexPath = [self.collectionView indexPathsForVisibleItems][0];
	DBCharacter* dbCharacter = [DBCharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]][indexPath.row];
	
	// Create SDECharacter object
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		[SDECharacter fromDBCharacter:[dbCharacter MR_inContext:localContext] inContext:localContext createShapeshift:YES];
	}];
	
	[NSNotificationCenter.defaultCenter postNotificationName:@"CharacterChangeNotification" object:nil];
	[[self valueForKey:@"_popoverController"] dismissPopoverAnimated:YES];
}

@end
