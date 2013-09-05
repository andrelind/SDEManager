#import "SDECharacterCell.h"

#import "SDEDiceView.h"
#import "SDEOutlineLabel.h"
#import "SDEAttributeView.h"
#import <CoreText/CoreText.h>

@interface SDECharacterCell ()
@property (nonatomic, weak) IBOutlet UIImageView* background;

@property (nonatomic, weak) IBOutlet UILabel* name;

@property (nonatomic, weak) IBOutlet SDEOutlineLabel* movementLabel;
@property (nonatomic, weak) IBOutlet SDEOutlineLabel* actionsLabel;
@property (nonatomic, weak) IBOutlet SDEOutlineLabel* heartsLabel;
@property (nonatomic, weak) IBOutlet SDEOutlineLabel* potionsLabel;

@property (nonatomic, weak) IBOutlet SDEAttributeView* attributesView;
@end

@implementation SDECharacterCell {
	NSMutableArray* _preloadedAttributes;
}

- (void)awakeFromNib {
	[super awakeFromNib];

	UIFont* font = nil;
	if(isIpad){
		font = [UIFont fontWithName:@"Adelon-Bold" size:19];
		self.attributesLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:11];
	} else {
		font = [UIFont fontWithName:@"Adelon-Bold" size:16];
		self.attributesLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:7];
	}
	
	self.movementLabel.font = font;
	self.actionsLabel.font = font;
	self.heartsLabel.font = font;
	self.potionsLabel.font = font;
}

- (void)prepareForReuse {
	[self.attStats reset];
	[self.armStats reset];
	[self.willStats reset];
	[self.dexStats reset];
	
	[self.attributesView reset];
	
	[super prepareForReuse];
}

- (void)setName:(NSString *)name type:(NSString *)type {
	if(!name) name = @"";
	if(!type) type = @"";
	
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@\n%@", name.uppercaseString, type.uppercaseString]];
	if(isIpad){
		NSInteger fontSize = 18;
		do {
			[string setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Adelon-Bold" size:fontSize]} range:NSMakeRange(0, name.length+1)];
			fontSize--;
		} while (string.size.width > self.name.frame.size.width);
		
		[string setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Adelon-Bold" size:9]} range:NSMakeRange(name.length, type.length + 1)];
		
		NSMutableParagraphStyle *style2 = [[NSMutableParagraphStyle alloc] init];
		style2.maximumLineHeight = 7;
		[string addAttribute:NSParagraphStyleAttributeName value:style2 range:NSMakeRange(name.length, type.length + 1)];
	} else {
		[string setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Adelon-Bold" size:15]} range:NSMakeRange(0, name.length+1)];
		[string setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Adelon-Bold" size:7]} range:NSMakeRange(name.length, type.length + 1)];
		
		NSMutableParagraphStyle *style2 = [[NSMutableParagraphStyle alloc] init];
		style2.maximumLineHeight = 5;
		[string addAttribute:NSParagraphStyleAttributeName value:style2 range:NSMakeRange(name.length, type.length + 1)];
	}
	
	self.name.attributedText = string;
}

- (void)setMovementCount:(NSUInteger)moveCount {
	[self setText:[NSString stringWithFormat:@"%i", moveCount] onLabel:self.movementLabel];
}

- (void)setNumberOfActions:(NSUInteger)actionsCount {
	[self setText:[NSString stringWithFormat:@"%i", actionsCount] onLabel:self.actionsLabel];
}

- (void)setNumberOfHearts:(NSUInteger)heartCount {
	[self setText:[NSString stringWithFormat:@"%i", heartCount] onLabel:self.heartsLabel];
}

- (void)setNumberOfPotions:(NSUInteger)potionCount {
	[self setText:[NSString stringWithFormat:@"%i", potionCount] onLabel:self.potionsLabel];
}

- (void)addAttributeIcon:(NSString *)iconToken title:(NSString *)title text:(NSString *)text {
	[self.attributesView addRowWithIcon:iconToken title:title text:text];
}

#pragma mark - Private

- (void)setText:(NSString *)text onLabel:(UILabel *)label {
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
	if(isIpad)
		[string addAttributes:@{ NSStrokeWidthAttributeName: @(-13),
								 NSStrokeColorAttributeName: UIColor.blackColor,
								 NSForegroundColorAttributeName: UIColor.whiteColor } range:NSMakeRange(0, string.length)];
	else
		[string addAttributes:@{ NSStrokeWidthAttributeName: @(-11),
								 NSStrokeColorAttributeName: UIColor.blackColor,
								 NSForegroundColorAttributeName: UIColor.whiteColor } range:NSMakeRange(0, string.length)];
		
	[label setAttributedText:string];
}

@end
