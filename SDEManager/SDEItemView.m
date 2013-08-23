#import "SDEItemView.h"

@interface SDEItemView ()
@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* headerLabel;
@property (nonatomic, weak) IBOutlet UILabel* modifierLabel;
@property (nonatomic, weak) IBOutlet UILabel* attributesLabel;
@property (nonatomic, weak) IBOutlet UITextView* additionalTextView;
@end

@implementation SDEItemView

- (void)awakeFromNib {
	[super awakeFromNib];
}

@end
