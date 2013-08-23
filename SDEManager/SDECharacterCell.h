#import <UIKit/UIKit.h>

@class SDEDiceView, SDEOutlineLabel;

@interface SDECharacterCell : UICollectionViewCell

@property (nonatomic, weak) IBOutlet UIImageView* characterImageView;

- (void)setName:(NSString *)name type:(NSString *)type;

#pragma mark - Basic Stats
@property (nonatomic, weak) IBOutlet SDEDiceView* attStats;
@property (nonatomic, weak) IBOutlet SDEDiceView* armStats;
@property (nonatomic, weak) IBOutlet SDEDiceView* willStats;
@property (nonatomic, weak) IBOutlet SDEDiceView* dexStats;

#pragma mark - Attributes
@property (nonatomic, weak) IBOutlet UILabel* attributesLabel;
- (void)addAttributeIcon:(NSString *)iconToken title:(NSString *)title text:(NSString *)text;

#pragma mark - Movement and Actions
- (void)setMovementCount:(NSUInteger)moveCount;
- (void)setNumberOfActions:(NSUInteger)actionsCount;

#pragma mark - Hearts and Potions
- (void)setNumberOfHearts:(NSUInteger)heartCount;
- (void)setNumberOfPotions:(NSUInteger)potionCount;

@end
