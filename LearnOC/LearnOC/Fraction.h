//
//  Fraction.h
//  LearnOC
//
//  Created by liudongbao on 12-4-13.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Fraction: NSObject { int numerator;
    int denominator; }
-(Fraction*) initWithNumerator: (int) n denominator: (int) d; -(void) print;
-(void) setNumerator: (int) d;
-(void) setDenominator: (int) d;
-(void) setNumerator: (int) n andDenominator: (int) d; -(int) numerator;
-(int) denominator;
@end