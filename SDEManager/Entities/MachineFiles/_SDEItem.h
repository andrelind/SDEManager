// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEItem.h instead.

#import <CoreData/CoreData.h>


extern const struct SDEItemAttributes {
	__unsafe_unretained NSString *additionalText;
	__unsafe_unretained NSString *header;
	__unsafe_unretained NSString *modifier;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *type;
} SDEItemAttributes;

extern const struct SDEItemRelationships {
	__unsafe_unretained NSString *characters;
} SDEItemRelationships;

extern const struct SDEItemFetchedProperties {
} SDEItemFetchedProperties;

@class SDECharacter;







@interface SDEItemID : NSManagedObjectID {}
@end

@interface _SDEItem : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SDEItemID*)objectID;





@property (nonatomic, strong) NSString* additionalText;



//- (BOOL)validateAdditionalText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* header;



//- (BOOL)validateHeader:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* modifier;



//- (BOOL)validateModifier:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* type;



@property int32_t typeValue;
- (int32_t)typeValue;
- (void)setTypeValue:(int32_t)value_;

//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *characters;

- (NSMutableSet*)charactersSet;





@end

@interface _SDEItem (CoreDataGeneratedAccessors)

- (void)addCharacters:(NSSet*)value_;
- (void)removeCharacters:(NSSet*)value_;
- (void)addCharactersObject:(SDECharacter*)value_;
- (void)removeCharactersObject:(SDECharacter*)value_;

@end

@interface _SDEItem (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAdditionalText;
- (void)setPrimitiveAdditionalText:(NSString*)value;




- (NSString*)primitiveHeader;
- (void)setPrimitiveHeader:(NSString*)value;




- (NSString*)primitiveModifier;
- (void)setPrimitiveModifier:(NSString*)value;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveType;
- (void)setPrimitiveType:(NSNumber*)value;

- (int32_t)primitiveTypeValue;
- (void)setPrimitiveTypeValue:(int32_t)value_;





- (NSMutableSet*)primitiveCharacters;
- (void)setPrimitiveCharacters:(NSMutableSet*)value;


@end
