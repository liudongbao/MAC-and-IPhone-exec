//
//  DrawingFunAppDelegate.h
//  DrawingFun
//
//  Created by 冬宝 刘 on 12-5-27.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class StretchView;
@interface DrawingFunAppDelegate : NSObject <NSApplicationDelegate>{
    IBOutlet StretchView * stretchView;
}

@property (assign) IBOutlet NSWindow *window;
-(IBAction)showOpenPanel:(id)sender;
@end
