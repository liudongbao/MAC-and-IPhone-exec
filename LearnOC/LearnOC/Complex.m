//
//  Complex.m
//  LearnOC
//
//  Created by liudongbao on 12-4-14.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Complex.h"
@implementation Complex
- (Complex *)initWithReal:(double)r andImaginary:(double)i
{
    self = [super init];

    if (self) {
        [self setReal:r andImaginary:i];
    }

    return self;
}

- (void)setReal:(double)r
{
    real = r;
}

- (void)setImaginary:(double)i
{
    imaginary = i;
}

- (void)setReal:(double)r andImaginary:(double)i
{
    real = r;
    imaginary = i;
}

- (double)real
{
    return real;
}

- (double)imaginary
{
    return imaginary;
}

- (void)print2
{
    printf("%_f + %_fi", real, imaginary);
}

@end
