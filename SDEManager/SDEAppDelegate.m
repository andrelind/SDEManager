#import "SDEAppDelegate.h"
#import "SDEAttribute.h"
#import "SDEAction.h"
#import "DBCharacter.h"
#import "SDECharacter.h"
#import "SDEItem.h"

@implementation SDEAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	[MagicalRecord setShouldAutoCreateManagedObjectModel:NO];
	[NSManagedObjectModel MR_setDefaultManagedObjectModel:[NSManagedObjectModel MR_newModelNamed:@"SDEManagerModel.momd" inBundleNamed:nil]];
	[MagicalRecord setupCoreDataStackWithAutoMigratingSqliteStoreNamed:@"SDEManager"];
	NSManagedObjectContext.MR_defaultContext.undoManager = nil;
	
	if(UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)
		isIpad = YES;

	
/*
	[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
		[DBCharacter MR_truncateAllInContext:localContext];
		[SDEAction MR_truncateAllInContext:localContext];
		[SDEItem MR_truncateAllInContext:localContext];
		[SDEAttribute MR_truncateAllInContext:localContext];
	}];
*/
	if(![SDEAttribute MR_countOfEntities]){
		NSString* attributesFile = [NSBundle.mainBundle pathForResource:@"attributes" ofType:@"txt"];
		
		[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
			for(NSString* line in [self linesInFileWithPath:attributesFile]){
				NSArray* props = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
				
				if(props.count > 1){
					SDEAttribute* att = [SDEAttribute MR_createInContext:localContext];
					att.type = @([props[0] integerValue]);
					att.title = props[1];
					att.longDescription = props[2];
				}
			}
		}];
	}

	if(![SDEAction MR_countOfEntities]){
		NSString* attributesFile = [NSBundle.mainBundle pathForResource:@"actions" ofType:@"txt"];
		
		[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
			for(NSString* line in [self linesInFileWithPath:attributesFile]){
				NSArray* props = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
				
				if(props.count > 2){
					SDEAction* action = [SDEAction MR_createInContext:localContext];
					action.title = props[0];
					action.token = props[1];
					NSArray* attributes = nil;
					action.text = [self findAttributeInString:props[2] attributeNames:&attributes];
					
					for(NSString* attributeName in attributes){
						SDEAttribute* attribute = [SDEAttribute MR_findFirstByAttribute:@"title" withValue:attributeName];
						if(attribute) [action addAttributesObject:attribute];
					}
				}
			}
		}];
	}
	
	if(![SDEItem MR_countOfEntities]){
		NSString* itemsFile = [NSBundle.mainBundle pathForResource:@"items" ofType:@"txt"];
		
		[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
			for(NSString* line in [self linesInFileWithPath:itemsFile]){
				NSArray* props = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
				
				if(props.count > 2){
					SDEItem* item = [SDEItem MR_createInContext:localContext];
					item.type = @([props[0] integerValue]);
					item.name = props[1];
					item.header = props[2];
					item.modifier = props[3];
					item.additionalText = props[5];
					
					NSArray* attributes = nil;
					item.attributeText = [self findAttributeInString:props[4] attributeNames:&attributes];
					
					for(NSString* attributeName in attributes){
						SDEAttribute* attribute = [SDEAttribute MR_findFirstByAttribute:@"title" withValue:attributeName];
						if(attribute) [item addAttributesObject:attribute];
					}
				}
			}
		}];
	}
	
	if(![DBCharacter MR_countOfEntities]){
		NSString* attributesFile = [NSBundle.mainBundle pathForResource:@"heroes" ofType:@"txt"];
		
		NSMutableDictionary* shapeshifts = [NSMutableDictionary dictionary];
		
		[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
			for(NSString* line in [self linesInFileWithPath:attributesFile]){
				NSArray* props = [line componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@";"]];
				
				if(props.count > 2){
					DBCharacter* character = [DBCharacter MR_createInContext:localContext];
					character.name = props[0];
					character.type = props[1];
					character.imageName = props[2];
					
					NSArray* baseStats = [props[3] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
					character.movement = @([baseStats[0] integerValue]);
					character.numberOfActions = @([baseStats[1] integerValue]);
					character.numberOfHearts = @([baseStats[2] integerValue]);
					character.numberOfPotions = @([baseStats[3] integerValue]);
					
					NSArray* attStats = [props[4] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
					character.attBlueDice = @([attStats[0] integerValue]);
					character.attRedDice = @([attStats[1] integerValue]);
					character.attGreenDice = @([attStats[2] integerValue]);
					character.attWhiteDice = @([attStats[3] integerValue]);

					NSArray* armStats = [props[5] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
					character.armBlueDice = @([armStats[0] integerValue]);
					character.armRedDice = @([armStats[1] integerValue]);
					character.armGreenDice = @([armStats[2] integerValue]);
					character.armWhiteDice = @([armStats[3] integerValue]);

					NSArray* willStats = [props[6] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
					character.willBlueDice = @([willStats[0] integerValue]);
					character.willRedDice = @([willStats[1] integerValue]);
					character.willGreenDice = @([willStats[2] integerValue]);
					character.willWhiteDice = @([willStats[3] integerValue]);

					NSArray* dexStats = [props[7] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"."]];
					character.dexBlueDice = @([dexStats[0] integerValue]);
					character.dexRedDice = @([dexStats[1] integerValue]);
					character.dexGreenDice = @([dexStats[2] integerValue]);
					character.dexWhiteDice = @([dexStats[3] integerValue]);
	
					NSArray* attributes = nil;
					character.abilitiesText = [self findAttributeInString:props[8] attributeNames:&attributes];
					
					for(NSString* attributeName in attributes){
						SDEAttribute* attribute = [SDEAttribute MR_findFirstByAttribute:@"title" withValue:attributeName];
						if(attribute) [character addAbilitiesObject:attribute];
					}
					
					NSArray* actions = [props[9] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@","]];
					for(NSString* actionName in actions){
						NSString* trimmedName = [actionName stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
						
						if([trimmedName rangeOfString:@"Shapeshift"].location != NSNotFound){
							// Pick the specific shapeshift action within "()"
							NSString* shapeshiftName = [trimmedName substringFromIndex:[trimmedName rangeOfString:@"("].location + 1];
							shapeshiftName = [shapeshiftName substringToIndex:[shapeshiftName rangeOfString:@")"].location];
							
							for(SDEAction* a in [SDEAction MR_findByAttribute:@"title" withValue:@"Shapeshift" inContext:localContext]){
								if([a.text isEqualToString:shapeshiftName]){
									[character.actionsSet addObject:a];
									break;
								}
							}
							
							[shapeshifts setObject:shapeshiftName forKey:character.name];
						} else {
							SDEAction* a = [SDEAction MR_findFirstByAttribute:@"title" withValue:trimmedName];
							if(a) [character.actionsSet addObject:a];
						}
					}
				}
			}
		}];
		
		[MagicalRecord saveWithBlockAndWait:^(NSManagedObjectContext *localContext) {
			[shapeshifts enumerateKeysAndObjectsUsingBlock:^(NSString* characterName, NSString* shapeshiftName, BOOL *stop) {
				DBCharacter* character = [DBCharacter MR_findFirstByAttribute:@"name" withValue:characterName inContext:localContext];
				DBCharacter* shapeshift = [DBCharacter MR_findFirstByAttribute:@"name" withValue:shapeshiftName inContext:localContext];
				if(shapeshift) character.shapeshift = shapeshift;
			}];
		}];
	}

    return YES;
}

- (NSString *)findAttributeInString:(NSString *)string attributeNames:(NSArray **)attributeNames {
	NSMutableArray* attributes = [NSMutableArray array];
	NSMutableArray* strings = [NSMutableArray array];
	
	for(NSString* s in [string componentsSeparatedByString:@","]){
		NSString* trimmed = [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
		
		if([s rangeOfString:@"X("].location != NSNotFound){
			NSString* substring = [trimmed stringByReplacingOccurrencesOfString:@"X(" withString:@""];	// Remove X(
			substring = [substring stringByReplacingOccurrencesOfString:@")" withString:@""]; // Remove )
			[strings addObject:substring];
			
			// Remove all tokens
			while ([trimmed rangeOfString:@"{"].location != NSNotFound) {
				NSRange r = NSMakeRange([trimmed rangeOfString:@"{"].location, [trimmed rangeOfString:@"}"].location - [trimmed rangeOfString:@"{"].location + 1);
				trimmed = [trimmed stringByReplacingCharactersInRange:r withString:@""];
				trimmed = [trimmed stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
			}
			
			if([trimmed rangeOfString:@"\""].location != NSNotFound){
				// If located furthest back, just remove, otherwise substring first
				if([trimmed rangeOfString:@"\""].location != trimmed.length-1)
					trimmed = [trimmed substringFromIndex:[trimmed rangeOfString:@"\""].location];
				trimmed = [trimmed stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@"\""]];
			}
			trimmed = [trimmed stringByReplacingOccurrencesOfString:@")" withString:@""];
			
			// Text within paranthesis could also be an attribute
			[attributes addObject:[trimmed substringFromIndex:[trimmed rangeOfString:@"("].location + 1]];
			[attributes addObject:[trimmed substringToIndex:[trimmed rangeOfString:@"("].location]];
		} else {
			trimmed = [trimmed stringByTrimmingCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@")"]]; // Remove )
			[attributes addObject:trimmed];	// Try to search for it...
			[strings addObject:trimmed];	// Just display it
		}
	}
		
	*attributeNames = attributes;
	return [strings componentsJoinedByString:@", "];
}

- (NSArray *)linesInFileWithPath:(NSString *)path {
	NSString* fileContents = [NSString stringWithContentsOfFile:path encoding:NSUTF8StringEncoding error:nil];
	return [fileContents componentsSeparatedByCharactersInSet:NSCharacterSet.newlineCharacterSet];
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
	// Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
	// Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
	// Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
	// If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
	// Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
	// Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
	// Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
