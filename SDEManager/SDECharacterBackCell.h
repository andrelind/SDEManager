#import <UIKit/UIKit.h>

@interface SDECharacterBackCell : UIView

@property (nonatomic, weak) IBOutlet UILabel* name;
@property (nonatomic, weak) IBOutlet UILabel* type;

- (void)reset;
- (void)addTitle:(NSString *)title text:(NSString *)text;

@end
