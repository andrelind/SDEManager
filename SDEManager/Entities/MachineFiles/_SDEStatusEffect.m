// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEStatusEffect.m instead.

#import "_SDEStatusEffect.h"

const struct SDEStatusEffectAttributes SDEStatusEffectAttributes = {
};

const struct SDEStatusEffectRelationships SDEStatusEffectRelationships = {
	.characters = @"characters",
};

const struct SDEStatusEffectFetchedProperties SDEStatusEffectFetchedProperties = {
};

@implementation SDEStatusEffectID
@end

@implementation _SDEStatusEffect

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SDEStatusEffect" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SDEStatusEffect";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SDEStatusEffect" inManagedObjectContext:moc_];
}

- (SDEStatusEffectID*)objectID {
	return (SDEStatusEffectID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic characters;

	
- (NSMutableSet*)charactersSet {
	[self willAccessValueForKey:@"characters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"characters"];
  
	[self didAccessValueForKey:@"characters"];
	return result;
}
	






@end
