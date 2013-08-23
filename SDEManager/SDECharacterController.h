#import <UIKit/UIKit.h>
#import "SDEStatusEffectsViewController.h"
#import "SDEStatusEffectView.h"
#import "SDEStatusEffectDetailView.h"

@class SDECharacterCell, SDECharacter;

@interface SDECharacterController : UIViewController <UISplitViewControllerDelegate, SDEStatusEffectsViewControllerDelegate, SDEStatusEffectViewDelegate, SDEStatusEffectDetailViewDelegate>

@property (nonatomic, weak) IBOutlet UIButton* characterListButton;
@property (nonatomic, weak) IBOutlet SDECharacterCell* characterView;
@property (nonatomic, retain) SDECharacter* character;

@end
