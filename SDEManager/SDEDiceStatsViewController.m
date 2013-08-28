#import "SDEDiceStatsViewController.h"

@interface SDEDiceStatsViewController ()

@property (nonatomic, weak) IBOutlet UIStepper* whiteStepper;
@property (nonatomic, weak) IBOutlet UIStepper* blueStepper;
@property (nonatomic, weak) IBOutlet UIStepper* redStepper;
@property (nonatomic, weak) IBOutlet UIStepper* greenStepper;

@property (nonatomic, weak) IBOutlet UILabel* whiteLabel;
@property (nonatomic, weak) IBOutlet UILabel* blueLabel;
@property (nonatomic, weak) IBOutlet UILabel* redLabel;
@property (nonatomic, weak) IBOutlet UILabel* greenLabel;

@property (nonatomic, weak) IBOutlet UILabel* resultLabel;

@end

@implementation SDEDiceStatsViewController

- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	
	[self whiteStepperChanged:nil];
	[self blueStepperChanged:nil];
	[self redStepperChanged:nil];
	[self greenStepperChanged:nil];
	
	UIFont* font = [UIFont fontWithName:@"Adelon-Bold" size:15];
	self.whiteLabel.font = font;
	self.blueLabel.font = font;
	self.redLabel.font = font;
	self.greenLabel.font = font;
	self.resultLabel.font = font;
}

- (IBAction)whiteStepperChanged:(id)sender {
	self.whiteLabel.text = @(self.whiteStepper.value).stringValue;
	[self recalcTotal];
}

- (IBAction)blueStepperChanged:(id)sender {
	self.blueLabel.text = @(self.blueStepper.value).stringValue;
	[self recalcTotal];
}

- (IBAction)redStepperChanged:(id)sender {
	self.redLabel.text = @(self.redStepper.value).stringValue;
	[self recalcTotal];
}

- (IBAction)greenStepperChanged:(id)sender {
	self.greenLabel.text = @(self.greenStepper.value).stringValue;
	[self recalcTotal];
}

- (void)recalcTotal {
	CGFloat total = self.whiteStepper.value * 1;
	total += self.blueStepper.value * 0.67;
	total += self.redStepper.value * 1.17;
	total += self.greenStepper.value * 2.0;
	
	self.resultLabel.text = [@"Average roll: " stringByAppendingString:@(total).stringValue];
}

@end
