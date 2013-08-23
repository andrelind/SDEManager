#import "SDEAttributeView.h"
#import "SDEOutlineLabel.h"

@interface SDEAttributeView ()
//@property (nonatomic, weak) IBOutlet UILabel* textLabel;
@property (nonatomic, retain) UILabel* typeLabel;
@property (nonatomic, retain) SDEOutlineLabel* diceLabel;

@property (nonatomic, retain) NSMutableAttributedString* storedAttributeString;
@property (nonatomic, retain) NSMutableArray *icons;
@end

@implementation SDEAttributeView

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.diceLabel = [[SDEOutlineLabel alloc] init];
	if(isIpad)
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:13];
	else
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:11];
	self.diceLabel.textAlignment = NSTextAlignmentCenter;
	self.icons = [NSMutableArray array];
}

- (void)reset {
	self.storedAttributeString = nil;
	self.attributedText = nil;
	
	for(UIImageView* v in self.icons)
		[v removeFromSuperview];
	[self.icons removeAllObjects];
}

#pragma mark - Public

- (void)addRowWithIcon:(NSString *)iconToken title:(NSString *)title text:(NSString *)text {
	if(self.storedAttributeString != nil)
		title = [@"\n" stringByAppendingString:title];
	
	NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
	style.firstLineHeadIndent = 22;
	style.headIndent = 22;
	style.maximumLineHeight = 16;
	style.paragraphSpacing = 7;
	
	NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@: %@", title, text]];
	if(isIpad){
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:11]} range:NSMakeRange(0, title.length+1)];
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(title.length+1, text.length+1)];
	} else {
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:8.5]} range:NSMakeRange(0, title.length+1)];
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:8.5]} range:NSMakeRange(title.length+1, text.length+1)];
	}
	
	if([attributedString.string rangeOfString:@"{b}"].location != NSNotFound)
		[self findInString:attributedString token:@"{b}" imageName:@"BlueDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([attributedString.string rangeOfString:@"{r}"].location != NSNotFound)
		[self findInString:attributedString token:@"{r}" imageName:@"RedDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([attributedString.string rangeOfString:@"{g}"].location != NSNotFound)
		[self findInString:attributedString token:@"{g}" imageName:@"GreenDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([attributedString.string rangeOfString:@"{w}"].location != NSNotFound)
		[self findInString:attributedString token:@"{w}" imageName:@"WhiteDie" imageOffset:CGPointMake(1, -5.5f) offset:CGPointMake(.5f, 0)];
	if([attributedString.string rangeOfString:@"{a}"].location != NSNotFound)
		[self findInString:attributedString token:@"{a}" imageName:@"ActionIcon" imageOffset:CGPointMake(7, -2.5f) offset:CGPointMake(.5f, -1)];
	
	if([attributedString.string rangeOfString:@"{ba}"].location != NSNotFound)
		[self findInString:attributedString token:@"{ba}" imageName:@"BlueActionIcon" imageOffset:CGPointMake(7, -2.5f) offset:CGPointMake(.5f, -1)];
	if([attributedString.string rangeOfString:@"{ra}"].location != NSNotFound)
		[self findInString:attributedString token:@"{ra}" imageName:@"RedActionIcon" imageOffset:CGPointMake(7, -2.5f) offset:CGPointMake(.5f, -1)];
	
	[attributedString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, attributedString.length)];
		
	if(self.storedAttributeString != nil)
	   [self.storedAttributeString appendAttributedString:attributedString];
	else
		self.storedAttributeString = attributedString;
	
	self.attributedText = self.storedAttributeString;
	
	dispatch_async(dispatch_get_main_queue(), ^{
		CGRect r = [self frameOfTextRange:[self.storedAttributeString.string rangeOfString:[[title stringByReplacingOccurrencesOfString:@"\n" withString:@""] stringByAppendingString:@":"]]];
		
		UIImageView* imageView = nil;
		if([iconToken rangeOfString:@"{ba}"].location != NSNotFound){
			imageView = [[UIImageView alloc] initWithImage:[self parseString:iconToken token:@"{ba}"]];
			imageView.frame = CGRectMake(0, 0, imageView.frame.size.width - 3, imageView.frame.size.height - 3);
			imageView.center = CGPointMake(imageView.frame.size.width*.5f + (isIpad ? 3 : 6), r.origin.y + imageView.frame.size.width*.5f - 2.5);
		} else if([iconToken rangeOfString:@"{ra}"].location != NSNotFound){
			imageView = [[UIImageView alloc] initWithImage:[self parseString:iconToken token:@"{ra}"]];
			imageView.frame = CGRectMake(0, 0, imageView.frame.size.width - 3, imageView.frame.size.height - 3);
			imageView.center = CGPointMake(imageView.frame.size.width*.5f + (isIpad ? 3 : 6), r.origin.y + imageView.frame.size.width*.5f - 2.5);
		} else if([iconToken rangeOfString:@"{p}"].location != NSNotFound){
			imageView = [[UIImageView alloc] initWithImage:[self parseString:iconToken token:@"{p}"]];
			imageView.frame = CGRectMake(0, 0, imageView.frame.size.width - 3, imageView.frame.size.height - 3);
			imageView.center = CGPointMake(imageView.frame.size.width*.5f + (isIpad ? 3 : 6), r.origin.y + imageView.frame.size.width*.5f - 2.5);
		}
		
		[self addSubview:imageView];
		[self.icons addObject:imageView];
	});
}

- (CGRect)frameOfTextRange:(NSRange)range {
	self.editable = YES;
    UITextPosition *beginning = self.beginningOfDocument;
	
    UITextPosition *start = [self positionFromPosition:beginning offset:range.location];
    UITextPosition *end = [self positionFromPosition:start offset:range.length];
    UITextRange *textRange = [self textRangeFromPosition:start toPosition:end];
    CGRect rect = [self convertRect:[self firstRectForRange:textRange] fromView:self.textInputView];
	
	self.editable = NO;
    return rect;
}

#pragma mark - Private

- (UIImage *)parseString:(NSString *)string token:(NSString *)token {
	NSRange diceRange = [string rangeOfString:token];
	
	NSRange textRange = NSMakeRange(diceRange.location + diceRange.length, [[string substringFromIndex:diceRange.location + diceRange.length] rangeOfString:@"}"].location + 1);
	NSString* t = [string substringWithRange:textRange];
	
	t = [t stringByReplacingOccurrencesOfString:@"{" withString:@""];
	t = [t stringByReplacingOccurrencesOfString:@"}" withString:@""];
	
	UIImage* image = nil;
	CGPoint textOffset;
	if([token isEqualToString:@"{ba}"]){
		image = [UIImage imageNamed:@"BlueActionIcon"];
		textOffset = CGPointMake(.5f, -1);
	} else if([token isEqualToString:@"{ra}"]){
		image = [UIImage imageNamed:@"RedActionIcon"];
		textOffset = CGPointMake(.5f, -1);
	} else {
		image = [UIImage imageNamed:@"PotionIcon"];
		textOffset = CGPointMake(.5f, 3);
	}
	
	return [self drawText:t inImage:image atPoint:textOffset];
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
