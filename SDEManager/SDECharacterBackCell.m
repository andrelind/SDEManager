#import "SDECharacterBackCell.h"
#import "SDEOutlineLabel.h"
#import "SDEAttributeTextView.h"

@interface SDECharacterBackCell ()

@property (nonatomic, retain) NSMutableAttributedString* storedAttributeString;

@property (nonatomic, retain) SDEOutlineLabel* diceLabel;
@end

@implementation SDECharacterBackCell {
}

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.diceLabel = [[SDEOutlineLabel alloc] init];
	if(isIpad)
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:13];
	else
		self.diceLabel.font = [UIFont fontWithName:@"Adelon-Bold" size:11];
	self.diceLabel.textAlignment = NSTextAlignmentCenter;

	
	if(isIpad){
		self.name.font = [UIFont fontWithName:@"Adelon-Bold" size:18];
		self.type.font = [UIFont fontWithName:@"Adelon-Bold" size:9];
	} else {
		self.name.font = [UIFont fontWithName:@"Adelon-Bold" size:15];
		self.type.font = [UIFont fontWithName:@"Adelon-Bold" size:7];
	}

	[self reset];
}

- (void)reset {
	self.storedAttributeString = nil;
	self.textView.attributedText = nil;
}

- (void)addTitle:(NSString *)title text:(NSString *)text {
	if(self.storedAttributeString != nil){
		[self.storedAttributeString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
		[self.storedAttributeString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:1]} range:NSMakeRange(self.storedAttributeString.length-2, 2)];
	}
		
	NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@: %@", title, text]];
	if(isIpad){
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:11]} range:NSMakeRange(0, title.length+1)];
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(title.length+1, text.length+1)];
	} else {
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:9]} range:NSMakeRange(0, title.length+1)];
		[attributedString setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:9]} range:NSMakeRange(title.length+1, text.length+1)];
	}
	
	if(self.storedAttributeString != nil)
		[self.storedAttributeString appendAttributedString:attributedString];
	else
		self.storedAttributeString = attributedString;
	self.textView.attributedText = self.storedAttributeString;
}

@end
