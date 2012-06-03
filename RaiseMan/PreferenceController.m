//
//  PreferenceController.m
//  RaiseMan
//
//  Created by 冬宝 刘 on 12-5-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "PreferenceController.h"



NSString * const BNRTableBgColorKey = @"TableBackgroundColor";
NSString *const BNREmptyDocKey = @"EmptyDocumentFlag";
NSString * const BNRColorChangedNotification = @"BNRColorChanged";

@implementation PreferenceController

/*
 *   - (id)initWithWindow:(NSWindow *)window
 *   {
 *    self = [super initWithWindow:window];
 *    if (self) {
 *        // Initialization code here.
 *    }
 *
 *    return self;
 *   }
 */
- (id)init
{
    self = [super initWithWindowNibName:@"Preferences"];
    if (self) {
        // Initialization code here.
    }
    return self;

}

- (void)windowDidLoad
{
    [super windowDidLoad];
	[colorWell setColor:
	 [PreferenceController preferenceTableBgColor]];
	[checkbox setState:
	 [PreferenceController preferenceEmptyDoc]];
    
    NSLog(@"Nib file is loaded");
}

- (IBAction)changeBackgroundColor:(id)sender
{
    NSColor *color = [colorWell color];
	[PreferenceController setPreferenceTableBgColor:color];
	
	NSNotificationCenter *nc = [NSNotificationCenter defaultCenter];
	NSLog(@"Sending notification");
	NSDictionary *d = [NSDictionary dictionaryWithObject:color
												  forKey:@"color"];
	[nc postNotificationName:BNRColorChangedNotification
					  object:self
					userInfo:d];
}
- (IBAction)changeNewEmptyDoc:(id)sender
{
    NSInteger state = [checkbox state];
    [PreferenceController setPreferenceEmptyDoc:state];
}


+ (NSColor *)preferenceTableBgColor
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSData *colorAsData = [defaults objectForKey:BNRTableBgColorKey];
	return [NSKeyedUnarchiver unarchiveObjectWithData:colorAsData];
}
+ (void)setPreferenceTableBgColor:(NSColor *)color
{
	NSData *colorAsData =
	[NSKeyedArchiver archivedDataWithRootObject:color];
	[[NSUserDefaults standardUserDefaults] setObject:colorAsData
											  forKey:BNRTableBgColorKey];
}
+ (BOOL)preferenceEmptyDoc
{
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	return [defaults boolForKey:BNREmptyDocKey];
}
+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc
{
	[[NSUserDefaults standardUserDefaults] setBool:emptyDoc
											forKey:BNREmptyDocKey];
}

@end