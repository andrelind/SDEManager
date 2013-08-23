#import "SDECharacterBackCell.h"

@interface SDECharacterBackCell ()
@property (nonatomic, weak) IBOutlet UITextView* textView;
@property (nonatomic, retain) NSMutableAttributedString* storedAttributeString;
@end

@implementation SDECharacterBackCell {
}

- (void)awakeFromNib {
	[super awakeFromNib];
	
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
	if(self.storedAttributeString != nil)
		[self.storedAttributeString appendAttributedString:[[NSAttributedString alloc] initWithString:@"\n\n"]];
	
	NSMutableAttributedString* newText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@: %@", title, text]];
	if(isIpad){
		[newText setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:11]} range:NSMakeRange(0, title.length+1)];
		[newText setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:11]} range:NSMakeRange(title.length+1, text.length+1)];
	} else {
		[newText setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"Arial-BoldMT" size:9]} range:NSMakeRange(0, title.length+1)];
		[newText setAttributes:@{NSFontAttributeName : [UIFont fontWithName:@"ArialMT" size:9]} range:NSMakeRange(title.length+1, text.length+1)];
	}
	
	if(self.storedAttributeString != nil)
		[self.storedAttributeString appendAttributedString:newText];
	else
		self.storedAttributeString = newText;
	self.textView.attributedText = self.storedAttributeString;
}

@end
