// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DBCharacter.h instead.

#import <CoreData/CoreData.h>


extern const struct DBCharacterAttributes {
	__unsafe_unretained NSString *abilitiesText;
	__unsafe_unretained NSString *armBlueDice;
	__unsafe_unretained NSString *armGreenDice;
	__unsafe_unretained NSString *armRedDice;
	__unsafe_unretained NSString *armWhiteDice;
	__unsafe_unretained NSString *attBlueDice;
	__unsafe_unretained NSString *attGreenDice;
	__unsafe_unretained NSString *attRedDice;
	__unsafe_unretained NSString *attWhiteDice;
	__unsafe_unretained NSString *dexBlueDice;
	__unsafe_unretained NSString *dexGreenDice;
	__unsafe_unretained NSString *dexRedDice;
	__unsafe_unretained NSString *dexWhiteDice;
	__unsafe_unretained NSString *imageName;
	__unsafe_unretained NSString *movement;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *numberOfActions;
	__unsafe_unretained NSString *numberOfHearts;
	__unsafe_unretained NSString *numberOfPotions;
	__unsafe_unretained NSString *type;
	__unsafe_unretained NSString *willBlueDice;
	__unsafe_unretained NSString *willGreenDice;
	__unsafe_unretained NSString *willRedDice;
	__unsafe_unretained NSString *willWhiteDice;
} DBCharacterAttributes;

extern const struct DBCharacterRelationships {
	__unsafe_unretained NSString *abilities;
	__unsafe_unretained NSString *actions;
	__unsafe_unretained NSString *shapeshift;
} DBCharacterRelationships;

extern const struct DBCharacterFetchedProperties {
} DBCharacterFetchedProperties;

@class SDEAttribute;
@class SDEAction;
@class DBCharacter;


























@interface DBCharacterID : NSManagedObjectID {}
@end

@interface _DBCharacter : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (DBCharacterID*)objectID;





@property (nonatomic, strong) NSString* abilitiesText;



//- (BOOL)validateAbilitiesText:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* armBlueDice;



@property int32_t armBlueDiceValue;
- (int32_t)armBlueDiceValue;
- (void)setArmBlueDiceValue:(int32_t)value_;

//- (BOOL)validateArmBlueDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* armGreenDice;



@property int32_t armGreenDiceValue;
- (int32_t)armGreenDiceValue;
- (void)setArmGreenDiceValue:(int32_t)value_;

//- (BOOL)validateArmGreenDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* armRedDice;



@property int32_t armRedDiceValue;
- (int32_t)armRedDiceValue;
- (void)setArmRedDiceValue:(int32_t)value_;

//- (BOOL)validateArmRedDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* armWhiteDice;



@property int32_t armWhiteDiceValue;
- (int32_t)armWhiteDiceValue;
- (void)setArmWhiteDiceValue:(int32_t)value_;

//- (BOOL)validateArmWhiteDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* attBlueDice;



@property int32_t attBlueDiceValue;
- (int32_t)attBlueDiceValue;
- (void)setAttBlueDiceValue:(int32_t)value_;

//- (BOOL)validateAttBlueDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* attGreenDice;



@property int32_t attGreenDiceValue;
- (int32_t)attGreenDiceValue;
- (void)setAttGreenDiceValue:(int32_t)value_;

//- (BOOL)validateAttGreenDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* attRedDice;



@property int32_t attRedDiceValue;
- (int32_t)attRedDiceValue;
- (void)setAttRedDiceValue:(int32_t)value_;

//- (BOOL)validateAttRedDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* attWhiteDice;



@property int32_t attWhiteDiceValue;
- (int32_t)attWhiteDiceValue;
- (void)setAttWhiteDiceValue:(int32_t)value_;

//- (BOOL)validateAttWhiteDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* dexBlueDice;



@property int32_t dexBlueDiceValue;
- (int32_t)dexBlueDiceValue;
- (void)setDexBlueDiceValue:(int32_t)value_;

//- (BOOL)validateDexBlueDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* dexGreenDice;



@property int32_t dexGreenDiceValue;
- (int32_t)dexGreenDiceValue;
- (void)setDexGreenDiceValue:(int32_t)value_;

//- (BOOL)validateDexGreenDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* dexRedDice;



@property int32_t dexRedDiceValue;
- (int32_t)dexRedDiceValue;
- (void)setDexRedDiceValue:(int32_t)value_;

//- (BOOL)validateDexRedDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* dexWhiteDice;



@property int32_t dexWhiteDiceValue;
- (int32_t)dexWhiteDiceValue;
- (void)setDexWhiteDiceValue:(int32_t)value_;

//- (BOOL)validateDexWhiteDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* imageName;



//- (BOOL)validateImageName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* movement;



@property int32_t movementValue;
- (int32_t)movementValue;
- (void)setMovementValue:(int32_t)value_;

//- (BOOL)validateMovement:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* name;



//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* numberOfActions;



@property int32_t numberOfActionsValue;
- (int32_t)numberOfActionsValue;
- (void)setNumberOfActionsValue:(int32_t)value_;

//- (BOOL)validateNumberOfActions:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* numberOfHearts;



@property int32_t numberOfHeartsValue;
- (int32_t)numberOfHeartsValue;
- (void)setNumberOfHeartsValue:(int32_t)value_;

//- (BOOL)validateNumberOfHearts:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* numberOfPotions;



@property int32_t numberOfPotionsValue;
- (int32_t)numberOfPotionsValue;
- (void)setNumberOfPotionsValue:(int32_t)value_;

//- (BOOL)validateNumberOfPotions:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* type;



//- (BOOL)validateType:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* willBlueDice;



@property int32_t willBlueDiceValue;
- (int32_t)willBlueDiceValue;
- (void)setWillBlueDiceValue:(int32_t)value_;

//- (BOOL)validateWillBlueDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* willGreenDice;



@property int32_t willGreenDiceValue;
- (int32_t)willGreenDiceValue;
- (void)setWillGreenDiceValue:(int32_t)value_;

//- (BOOL)validateWillGreenDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* willRedDice;



@property int32_t willRedDiceValue;
- (int32_t)willRedDiceValue;
- (void)setWillRedDiceValue:(int32_t)value_;

//- (BOOL)validateWillRedDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* willWhiteDice;



@property int32_t willWhiteDiceValue;
- (int32_t)willWhiteDiceValue;
- (void)setWillWhiteDiceValue:(int32_t)value_;

//- (BOOL)validateWillWhiteDice:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSSet *abilities;

- (NSMutableSet*)abilitiesSet;




@property (nonatomic, strong) NSOrderedSet *actions;

- (NSMutableOrderedSet*)actionsSet;




@property (nonatomic, strong) DBCharacter *shapeshift;

//- (BOOL)validateShapeshift:(id*)value_ error:(NSError**)error_;





@end

@interface _DBCharacter (CoreDataGeneratedAccessors)

- (void)addAbilities:(NSSet*)value_;
- (void)removeAbilities:(NSSet*)value_;
- (void)addAbilitiesObject:(SDEAttribute*)value_;
- (void)removeAbilitiesObject:(SDEAttribute*)value_;

- (void)addActions:(NSOrderedSet*)value_;
- (void)removeActions:(NSOrderedSet*)value_;
- (void)addActionsObject:(SDEAction*)value_;
- (void)removeActionsObject:(SDEAction*)value_;

@end

@interface _DBCharacter (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveAbilitiesText;
- (void)setPrimitiveAbilitiesText:(NSString*)value;




- (NSNumber*)primitiveArmBlueDice;
- (void)setPrimitiveArmBlueDice:(NSNumber*)value;

- (int32_t)primitiveArmBlueDiceValue;
- (void)setPrimitiveArmBlueDiceValue:(int32_t)value_;




- (NSNumber*)primitiveArmGreenDice;
- (void)setPrimitiveArmGreenDice:(NSNumber*)value;

- (int32_t)primitiveArmGreenDiceValue;
- (void)setPrimitiveArmGreenDiceValue:(int32_t)value_;




- (NSNumber*)primitiveArmRedDice;
- (void)setPrimitiveArmRedDice:(NSNumber*)value;

- (int32_t)primitiveArmRedDiceValue;
- (void)setPrimitiveArmRedDiceValue:(int32_t)value_;




- (NSNumber*)primitiveArmWhiteDice;
- (void)setPrimitiveArmWhiteDice:(NSNumber*)value;

- (int32_t)primitiveArmWhiteDiceValue;
- (void)setPrimitiveArmWhiteDiceValue:(int32_t)value_;




- (NSNumber*)primitiveAttBlueDice;
- (void)setPrimitiveAttBlueDice:(NSNumber*)value;

- (int32_t)primitiveAttBlueDiceValue;
- (void)setPrimitiveAttBlueDiceValue:(int32_t)value_;




- (NSNumber*)primitiveAttGreenDice;
- (void)setPrimitiveAttGreenDice:(NSNumber*)value;

- (int32_t)primitiveAttGreenDiceValue;
- (void)setPrimitiveAttGreenDiceValue:(int32_t)value_;




- (NSNumber*)primitiveAttRedDice;
- (void)setPrimitiveAttRedDice:(NSNumber*)value;

- (int32_t)primitiveAttRedDiceValue;
- (void)setPrimitiveAttRedDiceValue:(int32_t)value_;




- (NSNumber*)primitiveAttWhiteDice;
- (void)setPrimitiveAttWhiteDice:(NSNumber*)value;

- (int32_t)primitiveAttWhiteDiceValue;
- (void)setPrimitiveAttWhiteDiceValue:(int32_t)value_;




- (NSNumber*)primitiveDexBlueDice;
- (void)setPrimitiveDexBlueDice:(NSNumber*)value;

- (int32_t)primitiveDexBlueDiceValue;
- (void)setPrimitiveDexBlueDiceValue:(int32_t)value_;




- (NSNumber*)primitiveDexGreenDice;
- (void)setPrimitiveDexGreenDice:(NSNumber*)value;

- (int32_t)primitiveDexGreenDiceValue;
- (void)setPrimitiveDexGreenDiceValue:(int32_t)value_;




- (NSNumber*)primitiveDexRedDice;
- (void)setPrimitiveDexRedDice:(NSNumber*)value;

- (int32_t)primitiveDexRedDiceValue;
- (void)setPrimitiveDexRedDiceValue:(int32_t)value_;




- (NSNumber*)primitiveDexWhiteDice;
- (void)setPrimitiveDexWhiteDice:(NSNumber*)value;

- (int32_t)primitiveDexWhiteDiceValue;
- (void)setPrimitiveDexWhiteDiceValue:(int32_t)value_;




- (NSString*)primitiveImageName;
- (void)setPrimitiveImageName:(NSString*)value;




- (NSNumber*)primitiveMovement;
- (void)setPrimitiveMovement:(NSNumber*)value;

- (int32_t)primitiveMovementValue;
- (void)setPrimitiveMovementValue:(int32_t)value_;




- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;




- (NSNumber*)primitiveNumberOfActions;
- (void)setPrimitiveNumberOfActions:(NSNumber*)value;

- (int32_t)primitiveNumberOfActionsValue;
- (void)setPrimitiveNumberOfActionsValue:(int32_t)value_;




- (NSNumber*)primitiveNumberOfHearts;
- (void)setPrimitiveNumberOfHearts:(NSNumber*)value;

- (int32_t)primitiveNumberOfHeartsValue;
- (void)setPrimitiveNumberOfHeartsValue:(int32_t)value_;




- (NSNumber*)primitiveNumberOfPotions;
- (void)setPrimitiveNumberOfPotions:(NSNumber*)value;

- (int32_t)primitiveNumberOfPotionsValue;
- (void)setPrimitiveNumberOfPotionsValue:(int32_t)value_;




- (NSString*)primitiveType;
- (void)setPrimitiveType:(NSString*)value;




- (NSNumber*)primitiveWillBlueDice;
- (void)setPrimitiveWillBlueDice:(NSNumber*)value;

- (int32_t)primitiveWillBlueDiceValue;
- (void)setPrimitiveWillBlueDiceValue:(int32_t)value_;




- (NSNumber*)primitiveWillGreenDice;
- (void)setPrimitiveWillGreenDice:(NSNumber*)value;

- (int32_t)primitiveWillGreenDiceValue;
- (void)setPrimitiveWillGreenDiceValue:(int32_t)value_;




- (NSNumber*)primitiveWillRedDice;
- (void)setPrimitiveWillRedDice:(NSNumber*)value;

- (int32_t)primitiveWillRedDiceValue;
- (void)setPrimitiveWillRedDiceValue:(int32_t)value_;




- (NSNumber*)primitiveWillWhiteDice;
- (void)setPrimitiveWillWhiteDice:(NSNumber*)value;

- (int32_t)primitiveWillWhiteDiceValue;
- (void)setPrimitiveWillWhiteDiceValue:(int32_t)value_;





- (NSMutableSet*)primitiveAbilities;
- (void)setPrimitiveAbilities:(NSMutableSet*)value;



- (NSMutableOrderedSet*)primitiveActions;
- (void)setPrimitiveActions:(NSMutableOrderedSet*)value;



- (DBCharacter*)primitiveShapeshift;
- (void)setPrimitiveShapeshift:(DBCharacter*)value;


@end
