//
//  AppController.m
//  RaiseMan
//
//  Created by 冬宝 刘 on 12-5-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "AppController.h"
#import "PreferenceController.h"
@implementation AppController

+ (void)initialize
{
	// Create a dictionary
	NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
	
	// Archive the color object
	NSData *colorAsData = [NSKeyedArchiver archivedDataWithRootObject:
						   [NSColor yellowColor]];
	
	// Put defaults in the dictionary
	[defaultValues setObject:colorAsData forKey:BNRTableBgColorKey];
	[defaultValues setObject:[NSNumber numberWithBool:YES] forKey:BNREmptyDocKey];
	
	// Register the dictionary of defaults 
	[[NSUserDefaults standardUserDefaults] registerDefaults: defaultValues]; NSLog(@"registered defaults: %@", defaultValues);
}

- (BOOL)applicationShouldOpenUntitledFile:(NSApplication *)sender
{
	NSLog(@"applicationShouldOpenUntitledFile:");
	return [PreferenceController preferenceEmptyDoc];
}

- (IBAction)showPreferencePanel:(id)sender
{
	// Is preferenceController nil?
	if (!preferenceController) {
		preferenceController = [[PreferenceController alloc] init];
	}
	NSLog(@"showing %@", preferenceController);
	[preferenceController showWindow:self];
}

@end