// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to SDEAction.h instead.

#import <CoreData/CoreData.h>


extern const struct SDEActionAttributes {
	__unsafe_unretained NSString *text;
	__unsafe_unretained NSString *title;
	__unsafe_unretained NSString *token;
} SDEActionAttributes;

extern const struct SDEActionRelationships {
	__unsafe_unretained NSString *attributes;
	__unsafe_unretained NSString *dbCharacters;
	__unsafe_unretained NSString *items;
	__unsafe_unretained NSString *sdeCharacters;
} SDEActionRelationships;

extern const struct SDEActionFetchedProperties {
} SDEActionFetchedProperties;

@class SDEAttribute;
@class DBCharacter;
@class SDEItem;
@class SDECharacter;





@interface SDEActionID : NSManagedObjectID {}
@end

@interface _SDEAction : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (SDEActionID*)objectID;





@property (nonatomic, strong) NSString* text;



//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* token;



//- (BOOL)validateToken:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *attributes;

- (NSMutableSet*)attributesSet;




@property (nonatomic, strong) NSSet *dbCharacters;

- (NSMutableSet*)dbCharactersSet;




@property (nonatomic, strong) NSSet *items;

- (NSMutableSet*)itemsSet;




@property (nonatomic, strong) NSSet *sdeCharacters;

- (NSMutableSet*)sdeCharactersSet;





@end

@interface _SDEAction (CoreDataGeneratedAccessors)

- (void)addAttributes:(NSSet*)value_;
- (void)removeAttributes:(NSSet*)value_;
- (void)addAttributesObject:(SDEAttribute*)value_;
- (void)removeAttributesObject:(SDEAttribute*)value_;

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

@end

@interface _SDEAction (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




- (NSString*)primitiveToken;
- (void)setPrimitiveToken:(NSString*)value;





- (NSMutableSet*)primitiveAttributes;
- (void)setPrimitiveAttributes:(NSMutableSet*)value;



- (NSMutableSet*)primitiveDbCharacters;
- (void)setPrimitiveDbCharacters:(NSMutableSet*)value;



- (NSMutableSet*)primitiveItems;
- (void)setPrimitiveItems:(NSMutableSet*)value;



- (NSMutableSet*)primitiveSdeCharacters;
- (void)setPrimitiveSdeCharacters:(NSMutableSet*)value;


@end
