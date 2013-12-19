#import "SDECharacterController.h"
#import "SDECharacterCell.h"
#import "SDEDiceView.h"
#import "SDEAttributeView.h"
#import "SDECharacterBackCell.h"
#import "SDEStatusEffectDetailView.h"
#import "SDEItemView.h"
#import "SDEItemListViewController.h"

#import "SDECharacter.h"
#import "DBCharacter.h"
#import "SDEAction.h"
#import "SDEAttribute.h"
#import "SDEItem.h"

#import <SpriteKit/SpriteKit.h>

@interface UISplitViewController (Private)
- (void)toggleMasterVisible:(BOOL)toggle;
@end

@interface SDECharacterController ()
@property (nonatomic, weak) IBOutlet UIButton* redButton;
@property (nonatomic, weak) IBOutlet SDEItemView* redItemView;
@property (nonatomic, weak) IBOutlet UIButton* blueButton;
@property (nonatomic, weak) IBOutlet SDEItemView* blueItemView;
@property (nonatomic, weak) IBOutlet UIButton* yellowButton;
@property (nonatomic, weak) IBOutlet SDEItemView* yellowItemView;
@property (nonatomic, weak) IBOutlet UIButton* greenButton;
@property (nonatomic, weak) IBOutlet SDEItemView* greenItemView;

@property (nonatomic, retain) IBOutlet UIBarButtonItem* shapeshiftButton;

@property (nonatomic, retain) UIPopoverController* masterPopoverController;
@property (nonatomic, retain) UIPopoverController* generalPopoverController;
@property (nonatomic, retain) SDECharacterBackCell *flippedView;
@property (nonatomic, assign) BOOL isFlipped;

@property (nonatomic, retain) UIDynamicAnimator* animator;
@property (nonatomic, retain) UICollisionBehavior* collider;
@end

@implementation SDECharacterController

- (void)viewDidLoad {
    [super viewDidLoad];
		
	self.redItemView.alpha = 0;
	self.yellowItemView.alpha = 0;
	self.greenItemView.alpha = 0;
	self.blueItemView.alpha = 0;
	
	self.flippedView = [NSBundle.mainBundle loadNibNamed:@"SDECharacterBackCell" owner:self options:nil][0];
	if(isIpad)
		self.flippedView.frame = CGRectMake(0, 0, 300, 420);
	
	self.animator = [[UIDynamicAnimator alloc] initWithReferenceView:self.view];
}

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	if(UIInterfaceOrientationIsLandscape(self.interfaceOrientation)){
		self.characterListButton.alpha = 0.0;
		self.characterListButton.enabled = NO;
		self.character = nil;
	} else {
		self.character = [SDECharacter MR_findAllSortedBy:@"name" ascending:YES withPredicate:[NSPredicate predicateWithFormat:@"NOT type LIKE 'Shapeshift'"]].firstObject;
	}
}

- (void)setCharacter:(SDECharacter *)character {
	_character = [character MR_inThreadContext];
	
	if(self.isFlipped){
		[self flipView:nil];
		double delayInSeconds = .33;
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
			[self setCharacter:character];
		});
		return;
	}
	
	// Remove old status effects
	[self removeAllTokens];
	
	[self.characterView prepareForReuse];
	
	if(character.isShapeshiftedValue)
		character = character.shapeshift;
	
	self.characterView.characterImageView.image = [UIImage imageNamed:character.name];
	[self.characterView setName:character.name type:character.type];
	
	[self.characterView setMovementCount:character.movementValue];
	[self.characterView setNumberOfActions:character.numberOfActionsValue];
	
	[self.characterView setNumberOfHearts:character.numberOfHeartsValue];
	[self.characterView setNumberOfPotions:character.numberOfPotionsValue];
	
	// Setup base stats
	self.characterView.attStats.blueDice = character.attBlueDiceValue;
	self.characterView.attStats.redDice = character.attRedDiceValue;
	self.characterView.attStats.greenDice = character.attGreenDiceValue;
	self.characterView.attStats.whiteDice = character.attWhiteDiceValue;
	
	self.characterView.armStats.blueDice = character.armBlueDiceValue;
	self.characterView.armStats.redDice = character.armRedDiceValue;
	self.characterView.armStats.greenDice = character.armGreenDiceValue;
	self.characterView.armStats.whiteDice = character.armWhiteDiceValue;
	
	self.characterView.willStats.blueDice = character.willBlueDiceValue;
	self.characterView.willStats.redDice = character.willRedDiceValue;
	self.characterView.willStats.greenDice = character.willGreenDiceValue;
	self.characterView.willStats.whiteDice = character.willWhiteDiceValue;
	
	self.characterView.dexStats.blueDice = character.dexBlueDiceValue;
	self.characterView.dexStats.redDice = character.dexRedDiceValue;
	self.characterView.dexStats.greenDice = character.dexGreenDiceValue;
	self.characterView.dexStats.whiteDice = character.dexWhiteDiceValue;
	
	// Setup Attributes
	self.characterView.attributesLabel.text = character.abilitiesText;
	
	for (SDEAction* a in character.actions)
		[self.characterView addAttributeIcon:a.token title:a.title text:a.text];
	
	// Tokens are always loaded from original character
	[self createTokensForCharacter:_character];
	
	// Items are loaded from the original character always, never the shapeshift
	[self setupItemWithType:SDEItemTypeRed];
	[self setupItemWithType:SDEItemTypeYellow];
	[self setupItemWithType:SDEItemTypeGreen];
	[self setupItemWithType:SDEItemTypeBlue];
	
	if(self.character.shapeshift && self.toolbarItems.count < 7){
		NSMutableArray* items = [NSMutableArray arrayWithArray:self.toolbarItems];
		[items insertObject:self.shapeshiftButton atIndex:5];
		self.toolbarItems = items;
	} else if(!self.character.shapeshift && self.toolbarItems.count >= 7) {
		NSMutableArray* items = [NSMutableArray arrayWithArray:self.toolbarItems];
		[items removeObject:self.shapeshiftButton];
		self.toolbarItems = items;
	}
}

- (void)splitViewController:(UISplitViewController *)splitController willHideViewController:(UIViewController *)viewController withBarButtonItem:(UIBarButtonItem *)barButtonItem forPopoverController:(UIPopoverController *)popoverController {
    barButtonItem.title = NSLocalizedString(@"Master", @"Master");
	[UIView animateWithDuration:0.7 animations:^{
		self.characterListButton.alpha = 1.0;
		self.characterListButton.enabled = YES;
	}];
    self.masterPopoverController = popoverController;
	[self removeAllTokens];
	[self createTokensForCharacter:self.character];
}

- (void)splitViewController:(UISplitViewController *)splitController willShowViewController:(UIViewController *)viewController invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem {
    // Called when the view is shown again in the split view, invalidating the button and popover controller.
    [self.navigationItem setLeftBarButtonItem:nil animated:YES];
	[UIView animateWithDuration:0.7 animations:^{
		self.characterListButton.alpha = 0.0;
		self.characterListButton.enabled = NO;
	}];
	self.masterPopoverController = nil;
	
	[self removeAllTokens];
	[self createTokensForCharacter:self.character];
}

- (void)createTokensForCharacter:(SDECharacter *)character {
	NSInteger delay = 0;
	for(SDEAttribute* statusEffect in character.statusEffects){
		double delayInSeconds = delay * 0.2f;
		delay++;
		dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
		dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
			[self createStatusEffect:statusEffect atPoint:CGPointMake(self.view.frame.size.width*.5, 5)];
		});
	}
}

- (void)removeAllTokens {
	// Remove old status effects
	for(UIAttachmentBehavior* spring in self.animator.behaviors){
		if([spring isKindOfClass:UIAttachmentBehavior.class] && ![spring.items.firstObject isKindOfClass:SDEItemView.class]){
			[self.animator removeBehavior:spring];
			[self.collider removeItem:spring.items[0]];
			
			// Animate the item to 0 height/width
			[UIView animateWithDuration:0.7 animations:^{
				CGRect frame = ((SDEStatusEffectView*)spring.items[0]).frame;
				((SDEStatusEffectView*)spring.items[0]).frame = CGRectMake(frame.origin.x + frame.size.width*.5, frame.origin.y + frame.size.height*.5, 0, 0);
			} completion:^(BOOL finished) {
				// Remove the item
				[spring.items[0] removeFromSuperview];
			}];
		} else if([spring isKindOfClass:UIDynamicItemBehavior.class])
			[self.animator removeBehavior:spring];
	}
	
	NSLog(@"Remaining behaviours: %@", self.animator.behaviors);
}

#pragma mark - Actions

- (IBAction)addWound:(UIBarButtonItem *)sender {
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		SDEAttribute* wound = [SDEAttribute MR_createInContext:localContext];
		wound.title = @"Wound";
		wound.typeValue = SDEAttributeTypeWound;
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self createStatusEffect:[wound MR_inThreadContext] atPoint:CGPointMake(55, 45)];
		});
		[[[self.character MR_inContext:localContext] statusEffectsSet] addObject:wound];
	}];
}

- (IBAction)addPotion:(UIBarButtonItem *)sender {
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		SDEAttribute* wound = [SDEAttribute MR_createInContext:localContext];
		wound.title = @"Potion";
		wound.typeValue = SDEAttributeTypePotion;
		
		dispatch_async(dispatch_get_main_queue(), ^{
			[self createStatusEffect:[wound MR_inThreadContext] atPoint:CGPointMake(110, 45)];
		});
		[[[self.character MR_inContext:localContext] statusEffectsSet] addObject:wound];
	}];
}

- (IBAction)shapeshift:(id)sender {
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		SDECharacter* c = [self.character MR_inContext:localContext];
		c.isShapeshiftedValue = !c.isShapeshiftedValue;
		
		self.character = c;
	}];
}

- (IBAction)flipView:(id)sender {
	if(!self.isFlipped){
		[self.flippedView reset];
		
		SDECharacter* c = self.character.isShapeshiftedValue ? self.character.shapeshift : self.character;
		c = [c MR_inThreadContext];
		
		self.flippedView.name.text = c.name.uppercaseString;
		self.flippedView.type.text = c.type.uppercaseString;
		
		NSMutableSet* attributes = [NSMutableSet setWithSet:c.abilities];
		for (SDEAction* a in c.actions)
			[attributes addObjectsFromArray:a.attributes.allObjects];
		
		for(SDEItem* i in c.items){
			[attributes addObjectsFromArray:i.attributes.allObjects];
			
			for(SDEAction* a in i.actions)
				[attributes addObjectsFromArray:a.attributes.allObjects];
		}
		
		for(SDEAttribute* a in [attributes sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"title" ascending:YES]]])
			[self.flippedView addTitle:a.title text:a.longDescription];
		
		[UIView transitionFromView:self.characterView.contentView
							toView:self.flippedView
						  duration:.7f
						   options:UIViewAnimationOptionTransitionFlipFromLeft
						completion:nil];
		
		self.isFlipped = YES;
	} else {
		[UIView transitionFromView:self.flippedView
							toView:self.characterView.contentView
						  duration:.7f
						   options:UIViewAnimationOptionTransitionFlipFromRight
						completion:^(BOOL finished) {
							[self.flippedView reset];
							self.isFlipped = NO;
						}];
	}
}

- (IBAction)showList:(UIButton *)sender {
	if(!self.masterPopoverController){
		self.masterPopoverController = [[UIPopoverController alloc] initWithContentViewController:self.splitViewController.viewControllers[0]];
	}
	[self.masterPopoverController presentPopoverFromRect:sender.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

- (void)createStatusEffect:(SDEAttribute *)statusEffect atPoint:(CGPoint)point {
	// Create a statusEffectView at start position
	SDEStatusEffectView* effectView = [[SDEStatusEffectView alloc] initWithFrame:CGRectMake(point.x - 45, point.y, 45, 45)];
	effectView.statusEffect = statusEffect;
	effectView.statusEffectDelegate = self;
	[self.view addSubview:effectView];
	
	NSInteger woundCount = 0;
	NSInteger potionCount = 0;
	NSInteger statusCount = 0;
	for(UIAttachmentBehavior* d in self.animator.behaviors){
		if([d isKindOfClass:UIAttachmentBehavior.class] && [d.items.firstObject isKindOfClass:SDEStatusEffectView.class]){
			if([d.items.firstObject statusEffect].typeValue == SDEAttributeTypeWound) woundCount++;
			else if([d.items.firstObject statusEffect].typeValue == SDEAttributeTypePotion) potionCount++;
			else statusCount++;
		}
	}
	
	// Create spring for effectView with final resting point on anchor
	UIAttachmentBehavior* spring = nil;
	if(statusEffect.typeValue == SDEAttributeTypeWound)
		spring = [[UIAttachmentBehavior alloc] initWithItem:effectView attachedToAnchor:CGPointMake(effectView.frame.size.width*.5 + 10, self.view.frame.size.height - 75 - woundCount*65)];
	else if(statusEffect.typeValue == SDEAttributeTypePotion)
		spring = [[UIAttachmentBehavior alloc] initWithItem:effectView attachedToAnchor:CGPointMake(effectView.frame.size.width*.5 + 65, self.view.frame.size.height - 75 - potionCount*65)];
	else
		spring = [[UIAttachmentBehavior alloc] initWithItem:effectView attachedToAnchor:CGPointMake(self.view.frame.size.width - effectView.frame.size.width*.5 - 10, self.view.frame.size.height - 75 - statusCount*65)];
	spring.length = 0;
	spring.damping = 0.6;
	spring.frequency = 1.0;
	[self.animator addBehavior:spring];

	// Attach a collider to the item
	if(!self.collider){
		self.collider = [[UICollisionBehavior alloc] initWithItems:@[effectView]];
		self.collider.translatesReferenceBoundsIntoBoundary = YES;
		[self.animator addBehavior:self.collider];
	} else
		[self.collider addItem:effectView];
	
	UIDynamicItemBehavior* properties = [[UIDynamicItemBehavior alloc] initWithItems:@[effectView]];
	properties.angularResistance = .5;
	properties.elasticity = 0;
	
	[self.animator addBehavior:properties];
}

- (void)setupItemWithType:(SDEItemType)itemType {
	SDEItem* item = [self.character.items filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"type == %i", itemType]].anyObject;
	UIButton* button = nil;
	SDEItemView* itemView = nil;
	
	if(itemType == SDEItemTypeRed){
		button = self.redButton;
		itemView = self.redItemView;
	} else if(itemType == SDEItemTypeYellow){
		button = self.yellowButton;
		itemView = self.yellowItemView;
	} else if(itemType == SDEItemTypeGreen){
		button = self.greenButton;
		itemView = self.greenItemView;
	} else if(itemType == SDEItemTypeBlue){
		button = self.blueButton;
		itemView = self.blueItemView;
	}
	
	if(item){
		itemView.item = item;
		button.hidden = NO;
		itemView.hidden = NO;
		itemView.alpha = 1;
		
		CGPoint trueCenter = itemView.center;
		if(itemType == SDEItemTypeRed)
			itemView.center = CGPointMake(itemView.center.x, -itemView.frame.size.height);
		else if(itemType == SDEItemTypeYellow)
			itemView.center = CGPointMake(-itemView.frame.size.width, itemView.center.y);
		else if(itemType == SDEItemTypeGreen)
			itemView.center = CGPointMake(self.view.frame.size.width + itemView.frame.size.width, itemView.center.y);
		else if(itemType == SDEItemTypeBlue)
			itemView.center = CGPointMake(itemView.center.x, self.view.frame.size.height + itemView.frame.size.height);
		
		UIAttachmentBehavior* a = nil;
		for(UIAttachmentBehavior* attach in self.animator.behaviors){
			if([attach.items.firstObject isEqual:itemView]){
				a = attach;
				break;
			}
		}
		if(!a && itemView){
			UIAttachmentBehavior* spring = [[UIAttachmentBehavior alloc] initWithItem:itemView attachedToAnchor:trueCenter];
			spring.length = 0;
			spring.damping = 0.6;
			spring.frequency = 1.0;
			[self.animator addBehavior:spring];
			
			UIDynamicItemBehavior* properties = [[UIDynamicItemBehavior alloc] initWithItems:@[itemView]];
			properties.angularResistance = .5;
			properties.elasticity = 0;
			properties.resistance = 0.9;
			
			[self.animator addBehavior:properties];
			
			double delayInSeconds = 2.0;
			dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
			dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
				[self.animator removeBehavior:spring];
				[self.animator removeBehavior:properties];
			});
		}
		
		[UIView animateWithDuration:.8 animations:^{
			button.alpha = 0;
		} completion:^(BOOL finished) {
			button.hidden = YES;
		}];
		button.hidden = YES;
		[itemView addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(didTapItem:)]];
	} else {
		// Remove card if there is one visible
		button.hidden = NO;
		itemView.hidden = NO;
		
		for(UIAttachmentBehavior* attach in self.animator.behaviors){
			if([attach.items.firstObject isEqual:itemView])
				[self.animator removeBehavior:attach];
		}
		
		[UIView animateWithDuration:0.7 animations:^{
			button.alpha = 1;
			itemView.alpha = 0;
		} completion:^(BOOL finished) {
			button.hidden = NO;
			itemView.hidden = YES;
		}];
		
		UITapGestureRecognizer* tap = nil;
		for(UITapGestureRecognizer* t in itemView.gestureRecognizers){
			if([t isKindOfClass:UITapGestureRecognizer.class]){tap = t;}
		}
		if(tap) [itemView removeGestureRecognizer:tap];
	}
}

- (IBAction)showRedItems:(id)sender {
	[self showItemsWithType:SDEItemTypeRed fromButton:sender];
}

- (IBAction)showYellowItems:(id)sender {
	[self showItemsWithType:SDEItemTypeYellow fromButton:sender];
}

- (IBAction)showGreenItems:(id)sender {
	[self showItemsWithType:SDEItemTypeGreen fromButton:sender];
}

- (IBAction)showBlueItems:(id)sender {
	[self showItemsWithType:SDEItemTypeBlue fromButton:sender];
}

- (void)didTapItem:(UITapGestureRecognizer *)tap {
	SDEItem* item = ((SDEItemView*)tap.view).item;
	CGPoint p = [tap locationInView:self.view];
	
	UIActionSheet* sheet = [[UIActionSheet alloc] initWithTitle:item.name delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"Delete" otherButtonTitles:nil];
	sheet.tag = item.typeValue;
	[sheet showFromRect:CGRectMake(p.x, p.y, 1, 1) inView:self.view animated:YES];
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
	if(buttonIndex) return;
	
	SDEItem* item = [self.character.items filteredSetUsingPredicate:[NSPredicate predicateWithFormat:@"type == %i", actionSheet.tag]].anyObject;
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		[[self.character MR_inContext:localContext] removeItemsObject:[item MR_inContext:localContext]];
	}];
	
	_character = [self.character MR_inThreadContext];
	[self setupItemWithType:item.typeValue];
}

- (void)showItemsWithType:(SDEItemType)type fromButton:(UIButton *)button {
	SDEItemListViewController* nav = [self.storyboard instantiateViewControllerWithIdentifier:@"SDEItemList"];
	nav.itemType = type;
	nav.itemControllerDelegate	= self;
	
	self.generalPopoverController = [[UIPopoverController alloc] initWithContentViewController:nav];
	[self.generalPopoverController presentPopoverFromRect:button.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - Segue

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	if([segue.identifier isEqualToString:@"Status Effects"]){
		for(SDEStatusEffectsViewController* c in ((UINavigationController *)segue.destinationViewController).viewControllers){
			c.statusEffectDelegate = self;
			[c.excludedStatuses addObjectsFromArray:[self.character.statusEffects.allObjects filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"type != %i AND type != %i", SDEAttributeTypeWound, SDEAttributeTypePotion]]];
		}
		self.generalPopoverController = ((UIStoryboardPopoverSegue*)segue).popoverController;
	}
}

#pragma mark - SDEStatusEffectsViewControllerDelegate

- (void)statusEffectsViewController:(SDEStatusEffectsViewController *)controller didSelectStatusEffect:(SDEAttribute *)statusEffect {
	CGRect r = [controller.tableView rectForRowAtIndexPath:controller.tableView.indexPathForSelectedRow];
	r = [self.view convertRect:r fromView:controller.tableView];
	
	[self createStatusEffect:statusEffect atPoint:CGPointMake(r.origin.x + r.size.width - 45, r.origin.y)];
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		[[[self.character MR_inContext:localContext] statusEffectsSet] addObject:[statusEffect MR_inContext:localContext]];
	}];
}

#pragma mark - SDEStatusEffectViewDelegate

- (void)statusEffectViewWasTapped:(SDEStatusEffectView *)statusEffectView {
	SDEAttribute* statusEffect = [statusEffectView.statusEffect MR_inThreadContext];
	
	if(statusEffect.typeValue == SDEAttributeTypeWound || statusEffect.typeValue == SDEAttributeTypePotion){
		[self statusEffectDetailView:nil didPressRemoveStatus:statusEffectView.statusEffect];
		return;
	}
	
	SDEStatusEffectDetailView* view = [self.storyboard instantiateViewControllerWithIdentifier:@"SDEStatusEffectDetailView"];
	view.statusEffect = statusEffect;
	view.statusEffectDelegate = self;
	
	self.generalPopoverController = [[UIPopoverController alloc] initWithContentViewController:view];
	self.generalPopoverController.popoverContentSize = CGSizeMake(320, view.textHeight);
	[self.generalPopoverController presentPopoverFromRect:statusEffectView.frame inView:self.view permittedArrowDirections:UIPopoverArrowDirectionAny animated:YES];
}

#pragma mark - SDEStatusEffectDetailViewDelegate

- (void)statusEffectDetailView:(SDEStatusEffectDetailView *)view didPressRemoveStatus:(SDEAttribute *)statusEffect {
	for(UIAttachmentBehavior* spring in self.animator.behaviors){
		if([spring isKindOfClass:UIAttachmentBehavior.class] && [spring.items.firstObject isKindOfClass:SDEStatusEffectView.class]){
			if([((SDEStatusEffectView*)spring.items.firstObject).statusEffect isEqual:statusEffect]){
				// Iterate all of the items above and move them downwards
				NSInteger delay = 0;
				for(NSInteger i = [self.animator.behaviors indexOfObject:spring] + 1; i < self.animator.behaviors.count; i++){
					UIAttachmentBehavior* otherSpring = self.animator.behaviors[i];
					if(![otherSpring isKindOfClass:UIAttachmentBehavior.class]) continue;
					
					if(statusEffect.typeValue == SDEAttributeTypeWound && [otherSpring.items.firstObject statusEffect].typeValue != SDEAttributeTypeWound)
						continue;
					if(statusEffect.typeValue != SDEAttributeTypeWound && [otherSpring.items.firstObject statusEffect].typeValue == SDEAttributeTypeWound)
						continue;
					if(statusEffect.typeValue == SDEAttributeTypePotion && [otherSpring.items.firstObject statusEffect].typeValue != SDEAttributeTypePotion)
						continue;
					if(statusEffect.typeValue != SDEAttributeTypePotion && [otherSpring.items.firstObject statusEffect].typeValue == SDEAttributeTypePotion)
						continue;
					
					double delayInSeconds = .1 * (delay);
					delay++;
					dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
					dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
						otherSpring.anchorPoint = CGPointMake(otherSpring.anchorPoint.x, otherSpring.anchorPoint.y + 55);
					});
				}
				
				// Animate the item to 0 height/width
				[UIView animateWithDuration:0.7 animations:^{
					CGRect frame = ((SDEStatusEffectView*)spring.items[0]).frame;
					((SDEStatusEffectView*)spring.items[0]).frame = CGRectMake(frame.origin.x + frame.size.width*.5, frame.origin.y + frame.size.height*.5, 0, 0);
				} completion:^(BOOL finished) {
					// Remove the item
					[spring.items[0] removeFromSuperview];
					[self.animator removeBehavior:spring];
					[self.collider removeItem:spring.items[0]];
					
					[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
						[[[self.character MR_inContext:localContext] statusEffectsSet] removeObject:[statusEffect MR_inContext:localContext]];
					}];
				}];
				
				break;
			}
		}
	}
	
	[self.generalPopoverController dismissPopoverAnimated:YES];
	self.generalPopoverController = nil;
}

#pragma mark - SDEItemListViewControllerDelegate

- (void)itemListController:(SDEItemListViewController *)controller didSelectItem:(SDEItem *)item {
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		[[self.character MR_inContext:localContext] addItemsObject:[item MR_inContext:localContext]];
	}];
	
	_character = [self.character MR_inThreadContext];
	[self setupItemWithType:item.typeValue];
	
	[self.generalPopoverController dismissPopoverAnimated:YES];
	self.generalPopoverController = nil;
}

@end
