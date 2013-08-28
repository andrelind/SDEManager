// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEAttribute.h instead.

#import <CoreData/CoreData.h>


extern const struct SDEAttributeAttributes {
	__unsafe_unretained NSString *longDescription;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *type;
} SDEAttributeAttributes;

extern const struct SDEAttributeRelationships {
	__unsafe_unretained NSString *actions;
	__unsafe_unretained NSString *dbCharacters;
	__unsafe_unretained NSString *items;
	__unsafe_unretained NSString *sdeCharacters;
	__unsafe_unretained NSString *statusEffects;
} SDEAttributeRelationships;

extern const struct SDEAttributeFetchedProperties {
} SDEAttributeFetchedProperties;

@class SDEAction;
@class DBCharacter;
@class SDEItem;
@class SDECharacter;
@class SDECharacter;





@interface SDEAttributeID : NSManagedObjectID {}
@end

@interface _SDEAttribute : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SDEAttributeID*)objectID;





@property (nonatomic, strong) NSString* longDescription;



//- (BOOL)validateLongDescription:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int32_t typeValue;
- (int32_t)typeValue;
- (void)setTypeValue:(int32_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *actions;

- (NSMutableSet*)actionsSet;




@property (nonatomic, strong) NSSet *dbCharacters;

- (NSMutableSet*)dbCharactersSet;




@property (nonatomic, strong) NSSet *items;

- (NSMutableSet*)itemsSet;




@property (nonatomic, strong) NSSet *sdeCharacters;

- (NSMutableSet*)sdeCharactersSet;




@property (nonatomic, strong) NSSet *statusEffects;

- (NSMutableSet*)statusEffectsSet;





@end

@interface _SDEAttribute (CoreDataGeneratedAccessors)

- (void)addActions:(NSSet*)value_;
- (void)removeActions:(NSSet*)value_;
- (void)addActionsObject:(SDEAction*)value_;
- (void)removeActionsObject:(SDEAction*)value_;

- (void)addDbCharacters:(NSSet*)value_;
- (void)removeDbCharacters:(NSSet*)value_;
- (void)addDbCharactersObject:(DBCharacter*)value_;
- (void)removeDbCharactersObject:(DBCharacter*)value_;

- (void)addItems:(NSSet*)value_;
- (void)removeItems:(NSSet*)value_;
- (void)addItemsObject:(SDEItem*)value_;
- (void)removeItemsObject:(SDEItem*)value_;

- (void)addSdeCharacters:(NSSet*)value_;
- (void)removeSdeCharacters:(NSSet*)value_;
- (void)addSdeCharactersObject:(SDECharacter*)value_;
- (void)removeSdeCharactersObject:(SDECharacter*)value_;

- (void)addStatusEffects:(NSSet*)value_;
- (void)removeStatusEffects:(NSSet*)value_;
- (void)addStatusEffectsObject:(SDECharacter*)value_;
- (void)removeStatusEffectsObject:(SDECharacter*)value_;

@end

@interface _SDEAttribute (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveLongDescription;
- (void)setPrimitiveLongDescription:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int32_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int32_t)value_;





- (NSMutableSet*)primitiveActions;
- (void)setPrimitiveActions:(NSMutableSet*)value;



- (NSMutableSet*)primitiveDbCharacters;
- (void)setPrimitiveDbCharacters:(NSMutableSet*)value;



- (NSMutableSet*)primitiveItems;
- (void)setPrimitiveItems:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSdeCharacters;
- (void)setPrimitiveSdeCharacters:(NSMutableSet*)value;



- (NSMutableSet*)primitiveStatusEffects;
- (void)setPrimitiveStatusEffects:(NSMutableSet*)value;


@end
