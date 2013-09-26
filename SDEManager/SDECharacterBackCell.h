#import <UIKit/UIKit.h>

@interface SDECharacterBackCell : UIView

@property (nonatomic, weak) IBOutlet UILabel* name;
@property (nonatomic, weak) IBOutlet UILabel* type;
@property (nonatomic, weak) IBOutlet UITextView* textView;

- (void)reset;
- (void)addTitle:(NSString *)title text:(NSString *)text;

@end
