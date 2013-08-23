#import "_SDECharacter.h"

@class DBCharacter;

@interface SDECharacter : _SDECharacter {}

+ (SDECharacter *)fromDBCharacter:(DBCharacter *)dbCharacter inContext:(NSManagedObjectContext *)localContext createShapeshift:(BOOL)create;

@end
