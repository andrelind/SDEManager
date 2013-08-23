#import <UIKit/UIKit.h>

@class SDEAttribute;

@protocol SDEStatusEffectViewDelegate;

@interface SDEStatusEffectView : UIImageView

@property (nonatomic, retain) SDEAttribute *statusEffect;
@property (nonatomic, retain) id<SDEStatusEffectViewDelegate> statusEffectDelegate;

@end

@protocol SDEStatusEffectViewDelegate <NSObject>
- (void)statusEffectViewWasTapped:(SDEStatusEffectView *)statusEffectView;
@end
