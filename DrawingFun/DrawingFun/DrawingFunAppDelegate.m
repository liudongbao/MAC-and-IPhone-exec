//
//  DrawingFunAppDelegate.m
//  DrawingFun
//
//  Created by 冬宝 刘 on 12-5-27.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "DrawingFunAppDelegate.h"
#import "StretchView.h"

@implementation DrawingFunAppDelegate

@synthesize window = _window;

 
- (IBAction)showOpenPanel:(id)sender
{
    __block NSOpenPanel *panel = [NSOpenPanel openPanel];
    [panel setAllowedFileTypes:[NSImage imageFileTypes]];
    [panel beginSheetModalForWindow:[stretchView window]
                  completionHandler:^ (NSInteger result) {
                      if (result == NSOKButton) {
                          NSImage *image = [[NSImage alloc]
                                            initWithContentsOfURL:[panel URL]];
                          [stretchView setImage:image];
                      }
                      panel = nil; // prevent strong ref cycle
                  }];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

@end
