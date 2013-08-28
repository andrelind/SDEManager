#import "SDEAreaOrControlEffectViewController.h"
#import "SDEAttribute.h"

@interface SDEAreaOrControlEffectViewController ()

@property (nonatomic, weak) IBOutlet UITextView* textView;
@property (nonatomic, weak) IBOutlet UIImageView* imageView;

@property (nonatomic, retain) NSMutableAttributedString *attributedString;
@end

@implementation SDEAreaOrControlEffectViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	self.effect = self.effect;
}

- (void)setEffect:(SDEAttribute *)effect {
	_effect = effect;
	
//	self.imageView.image = [UIImage imageNamed:effect.title];
	
	self.attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@: %@\n\n", effect.title, effect.longDescription]];
	if(isIpad){
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:13]} range:NSMakeRange(0, effect.title.length+1)];
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:13]} range:NSMakeRange(effect.title.length+1, effect.longDescription.length+1)];
	} else {
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:11]} range:NSMakeRange(0, effect.title.length+1)];
		[self.attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(effect.title.length+1, effect.longDescription.length+1)];
	}
	
	NSTextAttachment* image = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
	image.image = [UIImage imageNamed:effect.title];
	NSAttributedString* a = [NSAttributedString attributedStringWithAttachment:image];
	[self.attributedString appendAttributedString:a];
	
	self.textView.attributedText = self.attributedString;
	
	
//	CGFloat h = [self.attributedString boundingRectWithSize:CGSizeMake(self.textView.frame.size.width - 10, CGFLOAT_MAX) options:(NSStringDrawingUsesLineFragmentOrigin|NSStringDrawingUsesFontLeading) context:nil].size.height;
//	self.textView.frame = CGRectMake(self.textView.frame.origin.x, self.textView.frame.origin.y, self.textView.frame.size.width, h);
}

@end
