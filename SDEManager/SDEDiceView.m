#import "SDEDiceView.h"
#import "SDEOutlineLabel.h"

@interface SDEDiceView ()
@property (nonatomic, retain) UIImageView *blueDie;
@property (nonatomic, retain) UIImageView *redDie;
@property (nonatomic, retain) UIImageView *greenDie;
@property (nonatomic, retain) UIImageView *whiteDie;

@property (nonatomic, retain) UILabel *helpLabel;
@end

@implementation SDEDiceView

- (id)initWithCoder:(NSCoder *)aDecoder {
	if((self = [super initWithCoder:aDecoder])){
		UIFont* font = [UIFont fontWithName:@"Adelon-Bold" size:13];
				
		self.blueDie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"BlueDie"]];
		[self addSubview:self.blueDie];
				
		self.redDie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"RedDie"]];
		[self addSubview:self.redDie];
		
		self.greenDie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"GreenDie"]];
		[self addSubview:self.greenDie];
		
		self.whiteDie = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WhiteDie"]];
		[self addSubview:self.whiteDie];
		
		SDEOutlineLabel* label = [[SDEOutlineLabel alloc] init];
		label.font = font;
		label.textAlignment = NSTextAlignmentCenter;
		self.helpLabel = label;
	}
	return self;
}

- (void)reset {
	_blueDice = 0;
	_redDice = 0;
	_greenDice = 0;
	_whiteDice = 0;
}

- (void)setBlueDice:(NSUInteger)blueDice {
	_blueDice = blueDice;
	[self setNeedsLayout];
}

- (void)setRedDice:(NSUInteger)redDice {
	_redDice = redDice;
	[self setNeedsLayout];
}

- (void)setGreenDice:(NSUInteger)greenDice {
	_greenDice = greenDice;
	[self setNeedsLayout];
}

- (void)setWhiteDice:(NSUInteger)whiteDice {
	_whiteDice = whiteDice;
	[self setNeedsLayout];
}

- (void)layoutSubviews {
	[super layoutSubviews];
	
	NSUInteger diceCount = self.blueDice ? 1 : 0;
	diceCount += self.redDice ? 1 : 0;
	diceCount += self.greenDice ? 1 : 0;
	diceCount += self.whiteDice ? 1 : 0;
	
	self.blueDie.hidden = !self.blueDice;
	self.redDie.hidden = !self.redDice;
	self.greenDie.hidden = !self.greenDice;
	self.whiteDie.hidden = !self.whiteDice;

	self.blueDie.image = [self drawText:@(self.blueDice).stringValue inImage:[UIImage imageNamed:@"BlueDie"] atPoint:(isIpad ? CGPointMake(0, 1) : CGPointMake(1, 0))];
	self.redDie.image = [self drawText:@(self.redDice).stringValue inImage:[UIImage imageNamed:@"RedDie"] atPoint:(isIpad ? CGPointMake(0, 1) : CGPointMake(1, 0))];
	self.greenDie.image = [self drawText:@(self.greenDice).stringValue inImage:[UIImage imageNamed:@"GreenDie"] atPoint:(isIpad ? CGPointMake(0, 1) : CGPointMake(1, 0))];
	self.whiteDie.image = [self drawText:@(self.whiteDice).stringValue inImage:[UIImage imageNamed:@"WhiteDie"] atPoint:(isIpad ? CGPointMake(0, 1) : CGPointMake(1, 0))];
	
	switch (diceCount) {
		case 0: {
			self.whiteDie.hidden = NO;
			[self centerDie:self.whiteDie];
			break;
		}
		case 1: {
			if(self.blueDice) [self centerDie:self.blueDie];
			if(self.redDice) [self centerDie:self.redDie];
			if(self.greenDice) [self centerDie:self.greenDie];
			if(self.whiteDice) [self centerDie:self.whiteDie];
			break;
		}
		case 2: {
			if(self.blueDice) [self leftAlignDie:self.blueDie offset:3];
			if(self.redDice){
				if(self.blueDice)
					[self rightAlignDie:self.redDie offset:3];
				else
					[self leftAlignDie:self.redDie offset:3];
			}
			if(self.greenDice){
				if(self.blueDice || self.redDice)
					[self rightAlignDie:self.greenDie offset:3];
				else
					[self leftAlignDie:self.greenDie offset:3];
			}
			if(self.whiteDice) [self rightAlignDie:self.whiteDie offset:3];
			break;
		}
		case 3: {
			if(self.blueDice) [self leftAlignDie:self.blueDie offset:6];
			if(self.redDice){
				if(self.blueDice)
					[self centerDie:self.redDie];
				else
					[self leftAlignDie:self.redDie offset:6];
			}
			if(self.greenDice){
				if(self.blueDice && self.redDice)
					[self rightAlignDie:self.greenDie offset:6];
				else
					[self centerDie:self.greenDie];
			}
			if(self.whiteDice) [self rightAlignDie:self.whiteDie offset:6];
			break;
		}
		case 4: {
			[self leftAlignDie:self.blueDie offset:9];
			[self leftAlignDie:self.redDie offset:3];
			[self rightAlignDie:self.greenDie offset:3];
			[self rightAlignDie:self.whiteDie offset:9];
			break;
		}
			
		default:
			break;
	}
}

- (UIImage *)drawText:(NSString*)text inImage:(UIImage*)image atPoint:(CGPoint)point {
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
	self.helpLabel.attributedText = string;
	[self.helpLabel drawTextInRect:CGRectIntegral(rect)];
	
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
	
    return newImage;
}

- (void)centerDie:(UIImageView *)die {
	die.frame = CGRectMake(self.frame.size.width *.5f - die.frame.size.width*.5f, self.frame.size.height*.5f - die.frame.size.height * .5, die.frame.size.width, die.frame.size.height);
}

- (void)leftAlignDie:(UIImageView *)die offset:(CGFloat)line {
	CGFloat offset = (self.frame.size.width * .5f) * .1f;	// Divide it in 10 "pieces"
	offset *= line;
	die.frame = CGRectMake(self.frame.size.width *.5f - die.frame.size.width*.5f - offset, self.frame.size.height*.5f - die.frame.size.height * .5, die.frame.size.width, die.frame.size.height);
}

- (void)rightAlignDie:(UIImageView *)die offset:(CGFloat)line {
	CGFloat offset = (self.frame.size.width * .5f) * .1f;	// Divide it in 10 "pieces"
	offset *= line;
	die.frame = CGRectMake(self.frame.size.width *.5f - die.frame.size.width*.5f + offset, self.frame.size.height*.5f - die.frame.size.height * .5, die.frame.size.width, die.frame.size.height);
}

@end
