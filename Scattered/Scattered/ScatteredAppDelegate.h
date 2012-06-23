//
//  ScatteredAppDelegate.h
//  Scattered
//
//  Created by  on 12-6-23.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import <QuartzCore/QuartzCore.h>
@interface ScatteredAppDelegate : NSObject <NSApplicationDelegate> {
    IBOutlet NSView *view;
    CATextLayer *textLayer;
}@
property (assign) IBOutlet NSWindow *window;
@end
