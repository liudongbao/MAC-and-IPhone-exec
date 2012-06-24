//
//  PreferenceController.h
//  RaiseMan
//
//  Created by 冬宝 刘 on 12-5-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
extern NSString * const BNRTableBgColorKey; 
extern NSString * const BNREmptyDocKey;

extern NSString * const BNRColorChangedNotification;

@interface PreferenceController : NSWindowController{
    IBOutlet NSColorWell *colorWell; 
    IBOutlet NSButton *checkbox;
}
- (IBAction)changeBackgroundColor:(id)sender;
- (IBAction)changeNewEmptyDoc:(id)sender;

+ (NSColor *)preferenceTableBgColor;
+ (void)setPreferenceTableBgColor:(NSColor *)color;
+ (BOOL)preferenceEmptyDoc;
+ (void)setPreferenceEmptyDoc:(BOOL)emptyDoc;
@end
