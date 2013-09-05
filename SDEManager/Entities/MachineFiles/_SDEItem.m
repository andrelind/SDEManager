// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEItem.m instead.

#import "_SDEItem.h"

const struct SDEItemAttributes SDEItemAttributes = {
	.additionalText = @"additionalText",
	.attributeText = @"attributeText",
	.boss = @"boss",
	.header = @"header",
	.modifier = @"modifier",
	.name = @"name",
	.type = @"type",
};

const struct SDEItemRelationships SDEItemRelationships = {
	.actions = @"actions",
	.attributes = @"attributes",
	.characters = @"characters",
};

const struct SDEItemFetchedProperties SDEItemFetchedProperties = {
};

@implementation SDEItemID
@end

@implementation _SDEItem

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SDEItem" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SDEItem";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SDEItem" inManagedObjectContext:moc_];
}

- (SDEItemID*)objectID {
	return (SDEItemID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"bossValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"boss"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"typeValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"type"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic additionalText;






@dynamic attributeText;






@dynamic boss;



- (int32_t)bossValue {
	NSNumber *result = [self boss];
	return [result intValue];
}

- (void)setBossValue:(int32_t)value_ {
	[self setBoss:[NSNumber numberWithInt:value_]];
}

- (int32_t)primitiveBossValue {
	NSNumber *result = [self primitiveBoss];
	return [result intValue];
}

- (void)setPrimitiveBossValue:(int32_t)value_ {
	[self setPrimitiveBoss:[NSNumber numberWithInt:value_]];
}





@dynamic header;






@dynamic modifier;






@dynamic name;






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
	

@dynamic attributes;

	
- (NSMutableSet*)attributesSet {
	[self willAccessValueForKey:@"attributes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"attributes"];
  
	[self didAccessValueForKey:@"attributes"];
	return result;
}
	

@dynamic characters;

	
- (NSMutableSet*)charactersSet {
	[self willAccessValueForKey:@"characters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"characters"];
  
	[self didAccessValueForKey:@"characters"];
	return result;
}
	






@end
