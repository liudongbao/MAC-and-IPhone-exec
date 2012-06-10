//
//  BigLetterView.h
//  TypingTutor
//
//  Created by  on 12-6-9.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface BigLetterView : NSView {
    NSColor     *bgColor;
    NSString    *string;
    NSMutableDictionary *attributes;
}
-(void)prepareAttributes;
- (IBAction)savePDF:(id)sender;
- (IBAction)cut:(id)sender;
- (IBAction)copy:(id)sender;
- (IBAction)paste:(id)sender;
@property (strong) NSColor  *bgColor;
@property (copy) NSString   *string;
@end