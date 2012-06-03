//
//  StretchView.m
//  DrawingFun
//
//  Created by 冬宝 刘 on 12-5-27.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "StretchView.h"

@implementation StretchView



- (id)initWithFrame:(NSRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Seed the random number generator
        srandom((unsigned)time(NULL));
        // Create a path object
        path = [NSBezierPath bezierPath];
        [path setLineWidth:3.0];
        NSPoint p = [self randomPoint];
        [path moveToPoint:p];
        int i;
        for (i = 0; i < 15; i++) {
            p = [self randomPoint];
            [path lineToPoint:p];
        }
        [path closePath];
        opacity = 1.0;
    }
    return self;
}


// randomPoint returns a random point inside the view
- (NSPoint)randomPoint
{
    NSPoint result;
    NSRect r = [self bounds];
    result.x = r.origin.x + random() % (int)r.size.width;
    result.y = r.origin.y + random() % (int)r.size.height;
    return result;
}
- (void)drawRect:(NSRect)rect
{
    NSRect bounds = [self bounds];
    // Fill the view with green
    [[NSColor greenColor] set];
    [NSBezierPath fillRect: bounds];
    // Draw the path in white
    [[NSColor whiteColor] set];
    [path fill];
    if (image) {
        NSRect imageRect;
        imageRect.origin = NSZeroPoint;
        imageRect.size = [image size];
        NSRect drawingRect = imageRect;
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositeSourceOver
                 fraction:opacity];
    }
}

#pragma mark Events
- (void)mouseDown:(NSEvent *)event
{
    NSLog(@"mouseDown: %ld", [event clickCount]);
}
- (void)mouseDragged:(NSEvent *)event
{
    NSPoint p = [event locationInWindow];
    NSLog(@"mouseDragged:%@", NSStringFromPoint(p));
}
- (void)mouseUp:(NSEvent *)event
{
    NSLog(@"mouseUp:");
}
#pragma mark Accessors
- (NSImage *)image
{
    return image;
}
- (void)setImage:(NSImage *)newImage
{
    image = newImage;
    [self setNeedsDisplay:YES];
}
- (float)opacity
{
    return opacity;
}
- (void)setOpacity:(float)x
{
    opacity = x;
    [self setNeedsDisplay:YES];
}
@end
