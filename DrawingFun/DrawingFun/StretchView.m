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
        NSRect drawingRect = [self currentRect];
        [image drawInRect:drawingRect
                 fromRect:imageRect
                operation:NSCompositeSourceOver
                 fraction:opacity];
    }
}

- (NSRect)currentRect
{
    float minX = MIN(downPoint.x, currentPoint.x);
    float maxX = MAX(downPoint.x, currentPoint.x);
    float minY = MIN(downPoint.y, currentPoint.y);
    float maxY = MAX(downPoint.y, currentPoint.y);
    return NSMakeRect(minX, minY, maxX-minX, maxY-minY);
}

#pragma mark Events
- (void)mouseDown:(NSEvent *)event
{
    NSLog(@"mouseDown: %ld", [event clickCount]);
    NSPoint p = [event locationInWindow];
    downPoint = [self convertPoint:p fromView:nil];
    currentPoint = downPoint;
    [self setNeedsDisplay:YES];
}
- (void)mouseDragged:(NSEvent *)event
{
    NSPoint p = [event locationInWindow];
    NSLog(@"mouseDragged:%@", NSStringFromPoint(p));
     currentPoint = [self convertPoint:p fromView:nil];
    [self autoscroll:event];
    [self setNeedsDisplay:YES];
}
- (void)mouseUp:(NSEvent *)event
{
    NSLog(@"mouseUp:");
    NSPoint p = [event locationInWindow];
    currentPoint = [self convertPoint:p fromView:nil];
    [self setNeedsDisplay:YES];
}
#pragma mark Accessors
- (NSImage *)image
{
    return image;
}
- (void)setImage:(NSImage *)newImage
{
    image = newImage;
    NSSize imageSize = [newImage size];
    downPoint = NSZeroPoint;
    currentPoint.x = downPoint.x + imageSize.width;
    currentPoint.y = downPoint.y + imageSize.height;
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
