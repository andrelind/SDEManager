// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEAttribute.m instead.

#import "_SDEAttribute.h"

const struct SDEAttributeAttributes SDEAttributeAttributes = {
	.longDescription = @"longDescription",
	.title = @"title",
	.type = @"type",
};

const struct SDEAttributeRelationships SDEAttributeRelationships = {
	.actions = @"actions",
	.dbCharacters = @"dbCharacters",
	.sdeCharacters = @"sdeCharacters",
	.statusEffects = @"statusEffects",
};

const struct SDEAttributeFetchedProperties SDEAttributeFetchedProperties = {
};

@implementation SDEAttributeID
@end

@implementation _SDEAttribute

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SDEAttribute" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SDEAttribute";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SDEAttribute" inManagedObjectContext:moc_];
}

- (SDEAttributeID*)objectID {
	return (SDEAttributeID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"typeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"type"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic longDescription;






@dynamic title;






@dynamic type;



- (int32_t)typeValue {
	NSNumber *result = [self type];
	return [result intValue];
}

- (void)setTypeValue:(int32_t)value_ {
	[self setType:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveTypeValue {
	NSNumber *result = [self primitiveType];
	return [result intValue];
}

- (void)setPrimitiveTypeValue:(int32_t)value_ {
	[self setPrimitiveType:[NSNumber numberWithInt:value_]];
}





@dynamic actions;

	
- (NSMutableSet*)actionsSet {
	[self willAccessValueForKey:@"actions"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"actions"];
  
	[self didAccessValueForKey:@"actions"];
	return result;
}
	

@dynamic dbCharacters;

	
- (NSMutableSet*)dbCharactersSet {
	[self willAccessValueForKey:@"dbCharacters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"dbCharacters"];
  
	[self didAccessValueForKey:@"dbCharacters"];
	return result;
}
	

@dynamic sdeCharacters;

	
- (NSMutableSet*)sdeCharactersSet {
	[self willAccessValueForKey:@"sdeCharacters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"sdeCharacters"];
  
	[self didAccessValueForKey:@"sdeCharacters"];
	return result;
}
	

@dynamic statusEffects;

	
- (NSMutableSet*)statusEffectsSet {
	[self willAccessValueForKey:@"statusEffects"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"statusEffects"];
  
	[self didAccessValueForKey:@"statusEffects"];
	return result;
}
	






@end
