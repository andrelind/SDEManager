// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DBCharacter.m instead.

#import "_DBCharacter.h"

const struct DBCharacterAttributes DBCharacterAttributes = {
	.abilitiesText = @"abilitiesText",
	.armBlueDice = @"armBlueDice",
	.armGreenDice = @"armGreenDice",
	.armRedDice = @"armRedDice",
	.armWhiteDice = @"armWhiteDice",
	.attBlueDice = @"attBlueDice",
	.attGreenDice = @"attGreenDice",
	.attRedDice = @"attRedDice",
	.attWhiteDice = @"attWhiteDice",
	.dexBlueDice = @"dexBlueDice",
	.dexGreenDice = @"dexGreenDice",
	.dexRedDice = @"dexRedDice",
	.dexWhiteDice = @"dexWhiteDice",
	.imageName = @"imageName",
	.movement = @"movement",
	.name = @"name",
	.numberOfActions = @"numberOfActions",
	.numberOfHearts = @"numberOfHearts",
	.numberOfPotions = @"numberOfPotions",
	.type = @"type",
	.willBlueDice = @"willBlueDice",
	.willGreenDice = @"willGreenDice",
	.willRedDice = @"willRedDice",
	.willWhiteDice = @"willWhiteDice",
};

const struct DBCharacterRelationships DBCharacterRelationships = {
	.abilities = @"abilities",
	.actions = @"actions",
	.shapeshift = @"shapeshift",
};

const struct DBCharacterFetchedProperties DBCharacterFetchedProperties = {
};

@implementation DBCharacterID
@end

@implementation _DBCharacter

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"DBCharacter" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"DBCharacter";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"DBCharacter" inManagedObjectContext:moc_];
}

- (DBCharacterID*)objectID {
	return (DBCharacterID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"armBlueDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"armBlueDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"armGreenDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"armGreenDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"armRedDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"armRedDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"armWhiteDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"armWhiteDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"attBlueDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attBlueDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"attGreenDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attGreenDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"attRedDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attRedDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"attWhiteDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"attWhiteDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dexBlueDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dexBlueDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dexGreenDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dexGreenDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dexRedDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dexRedDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"dexWhiteDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"dexWhiteDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"movementValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"movement"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"numberOfActionsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfActions"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"numberOfHeartsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfHearts"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"numberOfPotionsValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"numberOfPotions"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"willBlueDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"willBlueDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"willGreenDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"willGreenDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"willRedDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"willRedDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"willWhiteDiceValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"willWhiteDice"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic abilitiesText;






@dynamic armBlueDice;



- (int32_t)armBlueDiceValue {
	NSNumber *result = [self armBlueDice];
	return [result intValue];
}

- (void)setArmBlueDiceValue:(int32_t)value_ {
	[self setArmBlueDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveArmBlueDiceValue {
	NSNumber *result = [self primitiveArmBlueDice];
	return [result intValue];
}

- (void)setPrimitiveArmBlueDiceValue:(int32_t)value_ {
	[self setPrimitiveArmBlueDice:[NSNumber numberWithInt:value_]];
}





@dynamic armGreenDice;



- (int32_t)armGreenDiceValue {
	NSNumber *result = [self armGreenDice];
	return [result intValue];
}

- (void)setArmGreenDiceValue:(int32_t)value_ {
	[self setArmGreenDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveArmGreenDiceValue {
	NSNumber *result = [self primitiveArmGreenDice];
	return [result intValue];
}

- (void)setPrimitiveArmGreenDiceValue:(int32_t)value_ {
	[self setPrimitiveArmGreenDice:[NSNumber numberWithInt:value_]];
}





@dynamic armRedDice;



- (int32_t)armRedDiceValue {
	NSNumber *result = [self armRedDice];
	return [result intValue];
}

- (void)setArmRedDiceValue:(int32_t)value_ {
	[self setArmRedDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveArmRedDiceValue {
	NSNumber *result = [self primitiveArmRedDice];
	return [result intValue];
}

- (void)setPrimitiveArmRedDiceValue:(int32_t)value_ {
	[self setPrimitiveArmRedDice:[NSNumber numberWithInt:value_]];
}





@dynamic armWhiteDice;



- (int32_t)armWhiteDiceValue {
	NSNumber *result = [self armWhiteDice];
	return [result intValue];
}

- (void)setArmWhiteDiceValue:(int32_t)value_ {
	[self setArmWhiteDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveArmWhiteDiceValue {
	NSNumber *result = [self primitiveArmWhiteDice];
	return [result intValue];
}

- (void)setPrimitiveArmWhiteDiceValue:(int32_t)value_ {
	[self setPrimitiveArmWhiteDice:[NSNumber numberWithInt:value_]];
}





@dynamic attBlueDice;



- (int32_t)attBlueDiceValue {
	NSNumber *result = [self attBlueDice];
	return [result intValue];
}

- (void)setAttBlueDiceValue:(int32_t)value_ {
	[self setAttBlueDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAttBlueDiceValue {
	NSNumber *result = [self primitiveAttBlueDice];
	return [result intValue];
}

- (void)setPrimitiveAttBlueDiceValue:(int32_t)value_ {
	[self setPrimitiveAttBlueDice:[NSNumber numberWithInt:value_]];
}





@dynamic attGreenDice;



- (int32_t)attGreenDiceValue {
	NSNumber *result = [self attGreenDice];
	return [result intValue];
}

- (void)setAttGreenDiceValue:(int32_t)value_ {
	[self setAttGreenDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAttGreenDiceValue {
	NSNumber *result = [self primitiveAttGreenDice];
	return [result intValue];
}

- (void)setPrimitiveAttGreenDiceValue:(int32_t)value_ {
	[self setPrimitiveAttGreenDice:[NSNumber numberWithInt:value_]];
}





@dynamic attRedDice;



- (int32_t)attRedDiceValue {
	NSNumber *result = [self attRedDice];
	return [result intValue];
}

- (void)setAttRedDiceValue:(int32_t)value_ {
	[self setAttRedDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAttRedDiceValue {
	NSNumber *result = [self primitiveAttRedDice];
	return [result intValue];
}

- (void)setPrimitiveAttRedDiceValue:(int32_t)value_ {
	[self setPrimitiveAttRedDice:[NSNumber numberWithInt:value_]];
}





@dynamic attWhiteDice;



- (int32_t)attWhiteDiceValue {
	NSNumber *result = [self attWhiteDice];
	return [result intValue];
}

- (void)setAttWhiteDiceValue:(int32_t)value_ {
	[self setAttWhiteDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveAttWhiteDiceValue {
	NSNumber *result = [self primitiveAttWhiteDice];
	return [result intValue];
}

- (void)setPrimitiveAttWhiteDiceValue:(int32_t)value_ {
	[self setPrimitiveAttWhiteDice:[NSNumber numberWithInt:value_]];
}





@dynamic dexBlueDice;



- (int32_t)dexBlueDiceValue {
	NSNumber *result = [self dexBlueDice];
	return [result intValue];
}

- (void)setDexBlueDiceValue:(int32_t)value_ {
	[self setDexBlueDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDexBlueDiceValue {
	NSNumber *result = [self primitiveDexBlueDice];
	return [result intValue];
}

- (void)setPrimitiveDexBlueDiceValue:(int32_t)value_ {
	[self setPrimitiveDexBlueDice:[NSNumber numberWithInt:value_]];
}





@dynamic dexGreenDice;



- (int32_t)dexGreenDiceValue {
	NSNumber *result = [self dexGreenDice];
	return [result intValue];
}

- (void)setDexGreenDiceValue:(int32_t)value_ {
	[self setDexGreenDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDexGreenDiceValue {
	NSNumber *result = [self primitiveDexGreenDice];
	return [result intValue];
}

- (void)setPrimitiveDexGreenDiceValue:(int32_t)value_ {
	[self setPrimitiveDexGreenDice:[NSNumber numberWithInt:value_]];
}





@dynamic dexRedDice;



- (int32_t)dexRedDiceValue {
	NSNumber *result = [self dexRedDice];
	return [result intValue];
}

- (void)setDexRedDiceValue:(int32_t)value_ {
	[self setDexRedDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDexRedDiceValue {
	NSNumber *result = [self primitiveDexRedDice];
	return [result intValue];
}

- (void)setPrimitiveDexRedDiceValue:(int32_t)value_ {
	[self setPrimitiveDexRedDice:[NSNumber numberWithInt:value_]];
}





@dynamic dexWhiteDice;



- (int32_t)dexWhiteDiceValue {
	NSNumber *result = [self dexWhiteDice];
	return [result intValue];
}

- (void)setDexWhiteDiceValue:(int32_t)value_ {
	[self setDexWhiteDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveDexWhiteDiceValue {
	NSNumber *result = [self primitiveDexWhiteDice];
	return [result intValue];
}

- (void)setPrimitiveDexWhiteDiceValue:(int32_t)value_ {
	[self setPrimitiveDexWhiteDice:[NSNumber numberWithInt:value_]];
}





@dynamic imageName;






@dynamic movement;



- (int32_t)movementValue {
	NSNumber *result = [self movement];
	return [result intValue];
}

- (void)setMovementValue:(int32_t)value_ {
	[self setMovement:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveMovementValue {
	NSNumber *result = [self primitiveMovement];
	return [result intValue];
}

- (void)setPrimitiveMovementValue:(int32_t)value_ {
	[self setPrimitiveMovement:[NSNumber numberWithInt:value_]];
}





@dynamic name;






@dynamic numberOfActions;



- (int32_t)numberOfActionsValue {
	NSNumber *result = [self numberOfActions];
	return [result intValue];
}

- (void)setNumberOfActionsValue:(int32_t)value_ {
	[self setNumberOfActions:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberOfActionsValue {
	NSNumber *result = [self primitiveNumberOfActions];
	return [result intValue];
}

- (void)setPrimitiveNumberOfActionsValue:(int32_t)value_ {
	[self setPrimitiveNumberOfActions:[NSNumber numberWithInt:value_]];
}





@dynamic numberOfHearts;



- (int32_t)numberOfHeartsValue {
	NSNumber *result = [self numberOfHearts];
	return [result intValue];
}

- (void)setNumberOfHeartsValue:(int32_t)value_ {
	[self setNumberOfHearts:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberOfHeartsValue {
	NSNumber *result = [self primitiveNumberOfHearts];
	return [result intValue];
}

- (void)setPrimitiveNumberOfHeartsValue:(int32_t)value_ {
	[self setPrimitiveNumberOfHearts:[NSNumber numberWithInt:value_]];
}





@dynamic numberOfPotions;



- (int32_t)numberOfPotionsValue {
	NSNumber *result = [self numberOfPotions];
	return [result intValue];
}

- (void)setNumberOfPotionsValue:(int32_t)value_ {
	[self setNumberOfPotions:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveNumberOfPotionsValue {
	NSNumber *result = [self primitiveNumberOfPotions];
	return [result intValue];
}

- (void)setPrimitiveNumberOfPotionsValue:(int32_t)value_ {
	[self setPrimitiveNumberOfPotions:[NSNumber numberWithInt:value_]];
}





@dynamic type;






@dynamic willBlueDice;



- (int32_t)willBlueDiceValue {
	NSNumber *result = [self willBlueDice];
	return [result intValue];
}

- (void)setWillBlueDiceValue:(int32_t)value_ {
	[self setWillBlueDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWillBlueDiceValue {
	NSNumber *result = [self primitiveWillBlueDice];
	return [result intValue];
}

- (void)setPrimitiveWillBlueDiceValue:(int32_t)value_ {
	[self setPrimitiveWillBlueDice:[NSNumber numberWithInt:value_]];
}





@dynamic willGreenDice;



- (int32_t)willGreenDiceValue {
	NSNumber *result = [self willGreenDice];
	return [result intValue];
}

- (void)setWillGreenDiceValue:(int32_t)value_ {
	[self setWillGreenDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWillGreenDiceValue {
	NSNumber *result = [self primitiveWillGreenDice];
	return [result intValue];
}

- (void)setPrimitiveWillGreenDiceValue:(int32_t)value_ {
	[self setPrimitiveWillGreenDice:[NSNumber numberWithInt:value_]];
}





@dynamic willRedDice;



- (int32_t)willRedDiceValue {
	NSNumber *result = [self willRedDice];
	return [result intValue];
}

- (void)setWillRedDiceValue:(int32_t)value_ {
	[self setWillRedDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWillRedDiceValue {
	NSNumber *result = [self primitiveWillRedDice];
	return [result intValue];
}

- (void)setPrimitiveWillRedDiceValue:(int32_t)value_ {
	[self setPrimitiveWillRedDice:[NSNumber numberWithInt:value_]];
}





@dynamic willWhiteDice;



- (int32_t)willWhiteDiceValue {
	NSNumber *result = [self willWhiteDice];
	return [result intValue];
}

- (void)setWillWhiteDiceValue:(int32_t)value_ {
	[self setWillWhiteDice:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveWillWhiteDiceValue {
	NSNumber *result = [self primitiveWillWhiteDice];
	return [result intValue];
}

- (void)setPrimitiveWillWhiteDiceValue:(int32_t)value_ {
	[self setPrimitiveWillWhiteDice:[NSNumber numberWithInt:value_]];
}





@dynamic abilities;

	
- (NSMutableSet*)abilitiesSet {
	[self willAccessValueForKey:@"abilities"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"abilities"];
  
	[self didAccessValueForKey:@"abilities"];
	return result;
}
	

@dynamic actions;

	
- (NSMutableOrderedSet*)actionsSet {
	[self willAccessValueForKey:@"actions"];
  
	NSMutableOrderedSet *result = (NSMutableOrderedSet*)[self mutableOrderedSetValueForKey:@"actions"];
  
	[self didAccessValueForKey:@"actions"];
	return result;
}
	

@dynamic shapeshift;

	






@end
