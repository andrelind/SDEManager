#import "SDEAttributeTextView.h"
#import "SDEOutlineLabel.h"

@interface SDEAttributeTextView ()

@property (nonatomic, retain) SDEOutlineLabel* diceLabel;

@end

@implementation SDEAttributeTextView

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.diceLabel = [[SDEOutlineLabel alloc] init];
	if(isIpad)
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:13];
	else
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:11];
	self.diceLabel.textAlignment = NSTextAlignmentCenter;
}

- (void)setAttributedText:(NSAttributedString *)attributedText {
	NSMutableAttributedString* text = [[NSMutableAttributedString alloc] initWithAttributedString:attributedText];
	
	while([text.string rangeOfString:@"{b}"].location != NSNotFound)
		[self findInString:text token:@"{b}" imageName:@"BlueDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	while([text.string rangeOfString:@"{r}"].location != NSNotFound)
		[self findInString:text token:@"{r}" imageName:@"RedDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	while([text.string rangeOfString:@"{g}"].location != NSNotFound)
		[self findInString:text token:@"{g}" imageName:@"GreenDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	while([text.string rangeOfString:@"{w}"].location != NSNotFound)
		[self findInString:text token:@"{w}" imageName:@"WhiteDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	while([text.string rangeOfString:@"{a}"].location != NSNotFound)
		[self findInString:text token:@"{a}" imageName:@"ActionIcon" imageOffset:CGPointMake(7, -2.5f) offset:CGPointMake(.5f, -1)];
	
	while([text.string rangeOfString:@"{ba}"].location != NSNotFound)
		[self findInString:text token:@"{ba}" imageName:@"BlueActionIcon" imageOffset:CGPointMake(7, -2.5f) offset:CGPointMake(.5f, -1)];
	while([text.string rangeOfString:@"{ra}"].location != NSNotFound)
		[self findInString:text token:@"{ra}" imageName:@"RedActionIcon" imageOffset:CGPointMake(7, -2.5f) offset:CGPointMake(.5f, -1)];
	
	NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
	if(self.intendent){
		style.headIndent = 22;
		style.firstLineHeadIndent = 22;
	}
	style.maximumLineHeight = 16;
	style.paragraphSpacing = 7;
	[text addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, text.length)];
	
	[super setAttributedText:text];
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
	image.bounds = CGRectMake(imgOffset.x, imgOffset.y, diceImage.size.width - 5, diceImage.size.height - 5);
	
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
