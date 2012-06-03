//
//  StretchView.h
//  DrawingFun
//
//  Created by 冬宝 刘 on 12-5-27.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface StretchView : NSView {
    NSBezierPath *path;
    NSImage *image;
    float opacity;
}
@property (assign) float opacity;
@property (strong) NSImage *image;
-(NSPoint)randomPoint;

@end