#import <UIKit/UIKit.h>

@class SDEAttribute;
@protocol SDEStatusEffectsViewControllerDelegate;

@interface SDEStatusEffectsViewController : UITableViewController

@property (nonatomic, retain) NSMutableSet* excludedStatuses;
@property (nonatomic, retain) id<SDEStatusEffectsViewControllerDelegate> statusEffectDelegate;

@end

@protocol SDEStatusEffectsViewControllerDelegate <NSObject>
- (void)statusEffectsViewController:(SDEStatusEffectsViewController *)controller didSelectStatusEffect:(SDEAttribute *)statusEffect;
@end