#import <UIKit/UIKit.h>

@class SDEAttribute;

@protocol SDEStatusEffectDetailViewDelegate;

@interface SDEStatusEffectDetailView : UIViewController

@property (nonatomic, retain) id<SDEStatusEffectDetailViewDelegate> statusEffectDelegate;
@property (nonatomic, retain) SDEAttribute* statusEffect;
- (CGFloat)textHeight;

@end

@protocol SDEStatusEffectDetailViewDelegate <NSObject>
- (void)statusEffectDetailView:(SDEStatusEffectDetailView *)view didPressRemoveStatus:(SDEAttribute *)statusEffect;
@end
