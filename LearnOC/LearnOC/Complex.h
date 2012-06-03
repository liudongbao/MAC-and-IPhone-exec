//
//  Complex.h
//  LearnOC
//
//  Created by liudongbao on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface Complex : NSObject
{double real;
 double imaginary; }

- (Complex *)initWithReal:(double)r andImaginary:(double)i; - (void)setReal:(double)r;
- (void)setImaginary:(double)i;
- (void)setReal:(double)r andImaginary:(double)i; - (double)real;
- (double)imaginary; - (void)print2;
@end