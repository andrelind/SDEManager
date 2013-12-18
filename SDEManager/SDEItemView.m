#import "SDEItemView.h"
#import "SDEAction.h"
#import "SDEItem.h"
#import "SDEAttribute.h"
#import "SDEOutlineLabel.h"

@interface SDEItemView ()
@property (nonatomic, weak) IBOutlet UILabel* nameLabel;
@property (nonatomic, weak) IBOutlet UILabel* headerLabel;
@property (nonatomic, weak) IBOutlet UILabel* modifierLabel;
@property (nonatomic, weak) IBOutlet UILabel* attributesLabel;
@property (nonatomic, weak) IBOutlet UITextView* additionalTextView;

@property (nonatomic, retain) SDEOutlineLabel* diceLabel;
@end

@implementation SDEItemView

- (void)awakeFromNib {
	[super awakeFromNib];
	
	UIFont* font = [UIFont fontWithName:@"Adelon-Bold" size:14];
	
	self.diceLabel = [[SDEOutlineLabel alloc] init];
	self.diceLabel.textAlignment = NSTextAlignmentCenter;
	
	self.additionalTextView.editable = YES;
	if(isIpad){
		self.nameLabel.font = font;
		self.headerLabel.font = font;
		
		self.attributesLabel.font = [font fontWithSize:11];
		self.additionalTextView.font = [UIFont fontWithName:@"AlbertusMT-Italic" size:11];
		
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:13];
	} else {
		self.nameLabel.font = [font fontWithSize:13];
		self.headerLabel.font = font;
		
		self.attributesLabel.font = [font fontWithSize:7];
		self.additionalTextView.font = [UIFont fontWithName:@"AlbertusMT-Italic" size:7];
		
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:11];
	}
	self.additionalTextView.editable = NO;
}

- (void)setItem:(SDEItem *)item {
	_item = item;
	
	self.nameLabel.text = item.name.uppercaseString;
	[self.nameLabel sizeToFit];
	self.nameLabel.frame = CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y, self.nameLabel.frame.size.width + 5, self.nameLabel.frame.size.height);
	
	NSString* headerText = item.header.uppercaseString;
	if([headerText rangeOfString:@","].location == NSNotFound){
		headerText = [headerText stringByReplacingOccurrencesOfString:@"ATT" withString:@"ATTACK"];
		headerText = [headerText stringByReplacingOccurrencesOfString:@"ARM" withString:@"ARMOUR"];
	}
	
	NSMutableAttributedString* string = [[NSMutableAttributedString alloc] initWithString:headerText];
	NSInteger fontSize = 14;
	do {
		[string setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Adelon-Bold" size:fontSize]} range:NSMakeRange(0, headerText.length)];
		fontSize--;
	} while (string.size.width > self.nameLabel.frame.size.width);
	self.headerLabel.font = [self.headerLabel.font fontWithSize:fontSize < 14 ? fontSize - 1 : fontSize];
	[self setText:headerText onLabel:self.headerLabel withFontSize:fontSize-2];
		
	self.modifierLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:item.modifier];
	
	self.attributesLabel.text = item.attributeText;
	
	// Create actions + additional text
	NSMutableAttributedString* additionals = [[NSMutableAttributedString alloc] init];
	for(SDEAction* action in item.actions){
		NSMutableAttributedString* actionString = nil;
		if(action.token.length == 0){
			actionString = [[NSMutableAttributedString alloc] initWithString:[action.text stringByAppendingString:@"\n"]];
			if(isIpad)
				[actionString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(0, action.text.length)];
			else
				[actionString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:8.5]} range:NSMakeRange(0, action.text.length)];
		} else {
			actionString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@: %@\n", action.token, action.title, action.text]];
			if(isIpad){
				[actionString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:11]} range:NSMakeRange(action.token.length + 1, action.title.length+1)];
				[actionString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(action.token.length + 1 + action.title.length+1, action.text.length+1)];
			} else {
				[actionString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:8.5]} range:NSMakeRange(action.token.length + 1, action.title.length+1)];
				[actionString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:8.5]} range:NSMakeRange(action.token.length + 1 + action.title.length+1, action.text.length+1)];
			}
		}
		
		[additionals appendAttributedString:actionString];
	}

	NSMutableAttributedString* additionalText = [[NSMutableAttributedString alloc] initWithString:item.additionalText];
	if(isIpad)
		[additionalText setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"AlbertusMT-Italic" size:11]} range:NSMakeRange(0, additionalText.string.length)];
	else
		[additionalText setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"AlbertusMT-Italic" size:7]} range:NSMakeRange(0, additionalText.string.length)];
	[additionals appendAttributedString:additionalText];
	
	self.additionalTextView.attributedText = additionals;
	
	if(!self.gestureRecognizers.count){
#error Add Pan
	}
}

- (void)setText:(NSString *)text onLabel:(UILabel *)label withFontSize:(CGFloat)size {
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
	if(isIpad)
		[string addAttributes:@{ NSStrokeWidthAttributeName: @(-size),
								 NSStrokeColorAttributeName: UIColor.blackColor,
								 NSForegroundColorAttributeName: UIColor.whiteColor } range:NSMakeRange(0, string.length)];
	else
		[string addAttributes:@{ NSStrokeWidthAttributeName: @(-(size-2)),
								 NSStrokeColorAttributeName: UIColor.blackColor,
								 NSForegroundColorAttributeName: UIColor.whiteColor } range:NSMakeRange(0, string.length)];
	
	[label setAttributedText:string];
}

@end
