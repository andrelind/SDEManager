#import <UIKit/UIKit.h>
#import "SDEAttributeTextView.h"

@interface SDEAttributeView : SDEAttributeTextView

- (void)reset;
- (void)addRowWithIcon:(NSString *)iconToken title:(NSString *)title text:(NSString *)text;

@end
