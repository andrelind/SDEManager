#import "SDEItemView.h"
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
	
	UIFont* font = [UIFont fontWithName:@"Adelon-Bold" size:15];
	
	self.diceLabel = [[SDEOutlineLabel alloc] init];
	self.diceLabel.textAlignment = NSTextAlignmentCenter;
	
	self.additionalTextView.editable = YES;
	if(isIpad){
		self.nameLabel.font = font;
		self.headerLabel.font = [font fontWithSize:13];
		
		self.attributesLabel.font = [font fontWithSize:11];
		self.additionalTextView.font = [UIFont fontWithName:@"AlbertusMT-Italic" size:11];
		
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:13];
	} else {
		self.nameLabel.font = [font fontWithSize:13];
		self.headerLabel.font = [font fontWithSize:11];
		
		self.attributesLabel.font = [font fontWithSize:7];
		self.additionalTextView.font = [UIFont fontWithName:@"AlbertusMT-Italic" size:7];
		
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:11];
	}
	self.additionalTextView.editable = NO;
}

- (void)setItem:(SDEItem *)item {
	_item = item;
	
	[self setText:item.name onLabel:self.nameLabel withFontSize:15];
	[self.nameLabel sizeToFit];
	self.nameLabel.frame = CGRectMake(self.nameLabel.frame.origin.x, self.nameLabel.frame.origin.y, self.nameLabel.frame.size.width + 5, self.nameLabel.frame.size.height);
	
	NSString* headerText = item.header;
	if([headerText rangeOfString:@"ATT"].location != NSNotFound)
		headerText = @"ATTACK";
	else if([headerText rangeOfString:@"ARM"].location != NSNotFound)
		headerText = @"ARMOUR";
	[self setText:headerText onLabel:self.headerLabel withFontSize:13];
	

	NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:item.modifier];
	if([item.modifier rangeOfString:@"{b}"].location != NSNotFound)
		[self findInString:attributedString token:@"{b}" imageName:@"BlueDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([item.modifier rangeOfString:@"{r}"].location != NSNotFound)
		[self findInString:attributedString token:@"{r}" imageName:@"RedDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([item.modifier rangeOfString:@"{g}"].location != NSNotFound)
		[self findInString:attributedString token:@"{g}" imageName:@"GreenDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([item.modifier rangeOfString:@"{w}"].location != NSNotFound)
		[self findInString:attributedString token:@"{w}" imageName:@"WhiteDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([item.modifier rangeOfString:@"{a}"].location != NSNotFound)
		[self findInString:attributedString token:@"{a}" imageName:@"ActionIcon" imageOffset:CGPointMake(1, -2.5f) offset:CGPointMake(.5f, -1)];
	
	if([item.modifier rangeOfString:@"{ba}"].location != NSNotFound)
		[self findInString:attributedString token:@"{ba}" imageName:@"BlueActionIcon" imageOffset:CGPointMake(1, -2.5f) offset:CGPointMake(.5f, -1)];
	if([item.modifier rangeOfString:@"{ra}"].location != NSNotFound)
		[self findInString:attributedString token:@"{ra}" imageName:@"RedActionIcon" imageOffset:CGPointMake(1, -2.5f) offset:CGPointMake(.5f, -1)];
	self.modifierLabel.attributedText = attributedString;
	
	self.attributesLabel.text = item.attributeText;
	self.additionalTextView.text = item.additionalText;
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



- (void)findInString:(NSMutableAttributedString *)attributedString token:(NSString *)token imageName:(NSString *)imageName imageOffset:(CGPoint)imgOffset offset:(CGPoint)offset {
	NSRange diceRange = [attributedString.string rangeOfString:token];
	
	NSRange textRange = NSMakeRange(diceRange.location + diceRange.length, [[attributedString.string substringFromIndex:diceRange.location + diceRange.length] rangeOfString:@"}"].location + 1);
	NSString* t = [attributedString.string substringWithRange:textRange];
	
	t = [t stringByReplacingOccurrencesOfString:@"{" withString:@""];
	t = [t stringByReplacingOccurrencesOfString:@"}" withString:@""];
	
	NSTextAttachment* image = [[NSTextAttachment alloc] initWithData:nil ofType:nil];
	UIImage* diceImage = [UIImage imageNamed:imageName];
	image.image = [self drawText:t inImage:diceImage atPoint:offset];
	image.bounds = CGRectMake(imgOffset.x, imgOffset.y, diceImage.size.width, diceImage.size.height);
	
	NSAttributedString* a = [NSAttributedString attributedStringWithAttachment:image];
	[attributedString replaceCharactersInRange:diceRange withAttributedString:a];
	
	a = [[NSAttributedString alloc] initWithString:@""];
	[attributedString replaceCharactersInRange:NSMakeRange(textRange.location - diceRange.length + 1, textRange.length) withAttributedString:a];
}

- (UIImage*)drawText:(NSString*)text inImage:(UIImage*)image atPoint:(CGPoint)point {
    UIGraphicsBeginImageContextWithOptions(image.size, NO, image.scale);
    [image drawInRect:CGRectMake(0,0,image.size.width,image.size.height)];
    CGRect rect = CGRectMake(point.x, point.y, image.size.width, image.size.height);
    
	NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:text];
	if(isIpad)
		[string addAttributes:@{ NSStrokeWidthAttributeName: @(-13),
								 NSStrokeColorAttributeName: UIColor.blackColor,
								 NSForegroundColorAttributeName: UIColor.whiteColor } range:NSMakeRange(0, string.length)];
	else
		[string addAttributes:@{ NSStrokeWidthAttributeName: @(-11),
								 NSStrokeColorAttributeName: UIColor.blackColor,
								 NSForegroundColorAttributeName: UIColor.whiteColor } range:NSMakeRange(0, string.length)];
	
	self.diceLabel.frame = CGRectMake(0, 0, image.size.width, image.size.height);
	self.diceLabel.attributedText = string;
	[self.diceLabel drawTextInRect:CGRectIntegral(rect)];
	
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return newImage;
}


@end
