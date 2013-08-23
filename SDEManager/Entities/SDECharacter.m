#import "SDECharacter.h"
#import "DBCharacter.h"
#import "SDEAction.h"
#import "SDEAttribute.h"

@interface SDECharacter ()

// Private interface goes here.

@end


@implementation SDECharacter

+ (SDECharacter *)fromDBCharacter:(DBCharacter *)dbCharacter inContext:(NSManagedObjectContext *)localContext createShapeshift:(BOOL)create {
	SDECharacter* character = [SDECharacter MR_createInContext:localContext];
	
	character.imageName = dbCharacter.imageName;
	character.name = dbCharacter.name;
	character.type = dbCharacter.type;
	
	character.movement = dbCharacter.movement;
	character.numberOfActions = dbCharacter.numberOfActions;
	character.numberOfHearts = dbCharacter.numberOfHearts;
	character.numberOfPotions = dbCharacter.numberOfPotions;
	
	// Setup base stats
	character.attBlueDice = dbCharacter.attBlueDice;
	character.attRedDice = dbCharacter.attRedDice;
	character.attGreenDice = dbCharacter.attGreenDice;
	character.attWhiteDice = dbCharacter.attWhiteDice;
	
	character.armBlueDice = dbCharacter.armBlueDice;
	character.armRedDice = dbCharacter.armRedDice;
	character.armGreenDice = dbCharacter.armGreenDice;
	character.armWhiteDice = dbCharacter.armWhiteDice;
	
	character.willBlueDice = dbCharacter.willBlueDice;
	character.willRedDice = dbCharacter.willRedDice;
	character.willGreenDice = dbCharacter.willGreenDice;
	character.willWhiteDice = dbCharacter.willWhiteDice;
	
	character.dexBlueDice = dbCharacter.dexBlueDice;
	character.dexRedDice = dbCharacter.dexRedDice;
	character.dexGreenDice = dbCharacter.dexGreenDice;
	character.dexWhiteDice = dbCharacter.dexWhiteDice;
	
	// Setup Attributes
	character.abilitiesText = dbCharacter.abilitiesText;
	for(SDEAction * action in dbCharacter.actions)
		[character.actionsSet addObject:[action MR_inContext:localContext]];
	
	for(SDEAttribute* attribute in dbCharacter.abilities)
		[character addAbilitiesObject:[attribute MR_inContext:localContext]];
	
	if(dbCharacter.shapeshift){
		SDECharacter* shapeshift = nil;
		if(create)
			shapeshift = [SDECharacter fromDBCharacter:dbCharacter.shapeshift inContext:localContext createShapeshift:NO];
		else
			shapeshift = [SDECharacter MR_findFirstByAttribute:@"name" withValue:dbCharacter.shapeshift.name inContext:localContext];
		
		character.shapeshift = shapeshift;
	}
	
	return character;
}

@end
