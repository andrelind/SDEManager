#import <UIKit/UIKit.h>

@interface SDEDiceView : UIView

@property (nonatomic, assign) NSUInteger blueDice;
@property (nonatomic, assign) NSUInteger redDice;
@property (nonatomic, assign) NSUInteger greenDice;
@property (nonatomic, assign) NSUInteger whiteDice;

- (void)reset;

@end
