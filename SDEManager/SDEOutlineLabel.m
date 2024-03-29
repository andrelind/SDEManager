#import "SDEOutlineLabel.h"

@implementation SDEOutlineLabel

- (void)drawTextInRect:(CGRect)rect
{
	// We rely on stroke being set on the attributed text, if it isn't
	// just render this as usual.
	if (![[self attributedText] length])
	{
		[super drawTextInRect:rect];
		return;
	}
	
	// Retrieve the stroke width, assuming there is only a single
	// stroke width set.
	NSRangePointer pointer = nil;
	CGFloat strokeWidth = [[[self attributedText]
							attribute:NSStrokeWidthAttributeName
							atIndex:0
							effectiveRange:pointer] floatValue];
	
	// Retrieve the stroke colour, assuming there is only one stroke colour set.
	UIColor *strokeColor = [[self attributedText]
							attribute:NSStrokeColorAttributeName
							atIndex:0
							effectiveRange:pointer];
	
	// If width is zero or positive (positive is non-filled outlines!) or no
	// stroke colour is set. Render this as usual.
	if (strokeWidth >= 0 || !strokeColor)
	{
		[super drawTextInRect:rect];
		return;
	}
	
	// Store our original attributed string.
	NSAttributedString *original = [self attributedText];
	
	// Create a copy
	NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc]
												   initWithAttributedString:[self attributedText]];
	
	// Select the entire string.
	NSRange allCharacters = NSMakeRange(0, [attributedString length]);
	
	// Set the foreground colour the same as the outline.
	[attributedString addAttribute:NSForegroundColorAttributeName
							 value:strokeColor
							 range:allCharacters];
	
	// Draw this text (outline and text in same colour)
	[self setAttributedText:attributedString];
	[super drawTextInRect:rect];
	
	// Create a new string, this with the text colour of the original
	attributedString = [[NSMutableAttributedString alloc]
						initWithAttributedString:original];
	
	// But set the stroke colour to transparent (this makes the offset
	// and spacing exactly right)
	[attributedString addAttribute:NSStrokeColorAttributeName
							 value:[UIColor clearColor]
							 range:allCharacters];
	
	// Draw this text (normal text colour, transparent outline)
	[self setAttributedText:attributedString];
	[super drawTextInRect:rect];
	
	// Revert the attributed text to the original.
	[self setAttributedText:original];
}

@end
