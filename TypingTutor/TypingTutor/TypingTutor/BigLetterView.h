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
}
@property (strong) NSColor  *bgColor;
@property (copy) NSString   *string;
@end