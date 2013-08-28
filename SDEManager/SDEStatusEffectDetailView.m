#import "SDEStatusEffectDetailView.h"
#import "SDEAttribute.h"
#import <CoreText/CoreText.h>

@interface SDEStatusEffectDetailView ()
@property (nonatomic, weak) IBOutlet UIImageView* imageView;
@property (nonatomic, weak) IBOutlet UITextView* statusText;
@property (nonatomic, weak) IBOutlet UIButton* deleteButton;
@property (nonatomic, retain) NSMutableAttributedString* attributedString;
@end
@implementation SDEStatusEffectDetailView

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.statusEffect = self.statusEffect;
	
	self.imageView.layer.masksToBounds = YES;
	self.imageView.layer.cornerRadius = 22.5f;
	
	if(self.navigationController.navigationBar)
		self.deleteButton.hidden = YES;
}

- (void)setStatusEffect:(SDEAttribute *)statusEffect {
	_statusEffect = statusEffect;
	
	self.imageView.image = [UIImage imageNamed:statusEffect.title];
	
	self.attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@: %@", statusEffect.title, statusEffect.longDescription]];
	if(isIpad){
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:13]} range:NSMakeRange(0, statusEffect.title.length+1)];
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:13]} range:NSMakeRange(statusEffect.title.length+1, statusEffect.longDescription.length+1)];
	} else {
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:11]} range:NSMakeRange(0, statusEffect.title.length+1)];
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(statusEffect.title.length+1, statusEffect.longDescription.length+1)];
	}

	self.statusText.attributedText = self.attributedString;
}

- (CGFloat)textHeight {
	CGFloat h = [self.attributedString boundingRectWithSize:CGSizeMake(self.statusText.frame.size.width - 10, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil].size.height;
	self.statusText.frame = CGRectMake(self.statusText.frame.origin.x, self.statusText.frame.origin.y, self.statusText.frame.size.width, h);
	h += self.deleteButton.frame.size.height;
	return h + 45;
}

- (IBAction)removeStatus:(id)sender {
	[self.statusEffectDelegate statusEffectDetailView:self didPressRemoveStatus:self.statusEffect];
}

@end
