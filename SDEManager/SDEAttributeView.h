#import <UIKit/UIKit.h>

@interface SDEAttributeView : UITextView

- (void)reset;
- (void)addRowWithIcon:(NSString *)iconToken title:(NSString *)title text:(NSString *)text;

@end
