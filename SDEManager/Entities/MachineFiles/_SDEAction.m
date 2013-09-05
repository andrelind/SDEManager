// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEAction.m instead.

#import "_SDEAction.h"

const struct SDEActionAttributes SDEActionAttributes = {
	.text = @"text",
	.title = @"title",
	.token = @"token",
};

const struct SDEActionRelationships SDEActionRelationships = {
	.attributes = @"attributes",
	.dbCharacters = @"dbCharacters",
	.items = @"items",
	.sdeCharacters = @"sdeCharacters",
};

const struct SDEActionFetchedProperties SDEActionFetchedProperties = {
};

@implementation SDEActionID
@end

@implementation _SDEAction

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"SDEAction" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"SDEAction";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"SDEAction" inManagedObjectContext:moc_];
}

- (SDEActionID*)objectID {
	return (SDEActionID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	

	return keyPaths;
}




@dynamic text;






@dynamic title;






@dynamic token;






@dynamic attributes;

	
- (NSMutableSet*)attributesSet {
	[self willAccessValueForKey:@"attributes"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"attributes"];
  
	[self didAccessValueForKey:@"attributes"];
	return result;
}
	

@dynamic dbCharacters;

	
- (NSMutableSet*)dbCharactersSet {
	[self willAccessValueForKey:@"dbCharacters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"dbCharacters"];
  
	[self didAccessValueForKey:@"dbCharacters"];
	return result;
}
	

@dynamic items;

	
- (NSMutableSet*)itemsSet {
	[self willAccessValueForKey:@"items"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"items"];
  
	[self didAccessValueForKey:@"items"];
	return result;
}
	

@dynamic sdeCharacters;

	
- (NSMutableSet*)sdeCharactersSet {
	[self willAccessValueForKey:@"sdeCharacters"];
  
	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"sdeCharacters"];
  
	[self didAccessValueForKey:@"sdeCharacters"];
	return result;
}
	






@end
