#import "SDEStatusEffectView.h"
#import "SDEAttribute.h"

@implementation SDEStatusEffectView

- (id)initWithFrame:(CGRect)frame {
	if(self = [super initWithFrame:frame]){
		self.userInteractionEnabled = YES;
		self.layer.masksToBounds = YES;
		self.layer.rasterizationScale = [UIScreen mainScreen].scale;
		self.layer.shouldRasterize = YES;
		
//		self.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
		[self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap)]];
	}
	return self;
}

- (void)awakeFromNib {
	[super awakeFromNib];
	
	self.layer.masksToBounds = YES;
	self.layer.rasterizationScale = [UIScreen mainScreen].scale;
	self.layer.shouldRasterize = YES;
}

- (void)setStatusEffect:(SDEAttribute *)statusEffect {
	_statusEffect = statusEffect;
	
	self.image = [UIImage imageNamed:[statusEffect.title stringByReplacingOccurrencesOfString:@": X" withString:@""]];
	self.layer.cornerRadius = self.image.size.width * .5f;
}

- (void)tap {
	[self.statusEffectDelegate statusEffectViewWasTapped:self];
}

@end
