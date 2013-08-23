// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEStatusEffect.h instead.

#import <CoreData/CoreData.h>


extern const struct SDEStatusEffectAttributes {
} SDEStatusEffectAttributes;

extern const struct SDEStatusEffectRelationships {
	__unsafe_unretained NSString *characters;
} SDEStatusEffectRelationships;

extern const struct SDEStatusEffectFetchedProperties {
} SDEStatusEffectFetchedProperties;

@class SDECharacter;


@interface SDEStatusEffectID : NSManagedObjectID {}
@end

@interface _SDEStatusEffect : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SDEStatusEffectID*)objectID;





@property (nonatomic, strong) NSSet *characters;

- (NSMutableSet*)charactersSet;





@end

@interface _SDEStatusEffect (CoreDataGeneratedAccessors)

- (void)addCharacters:(NSSet*)value_;
- (void)removeCharacters:(NSSet*)value_;
- (void)addCharactersObject:(SDECharacter*)value_;
- (void)removeCharactersObject:(SDECharacter*)value_;

@end

@interface _SDEStatusEffect (CoreDataGeneratedPrimitiveAccessors)



- (NSMutableSet*)primitiveCharacters;
- (void)setPrimitiveCharacters:(NSMutableSet*)value;


@end
