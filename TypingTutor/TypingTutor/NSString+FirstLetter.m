//
//  NSString+FirstLetter.m
//  TypingTutor
//
//  Created by  on 12-6-10.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "NSString+FirstLetter.h"

@implementation NSString (FirstLetter)
- (NSString *)bnr_firstLetter
{
    if ([self length] < 2) {
        return self;
    }
    NSRange r;
    r.location = 0;
    r.length = 1;
    return [self substringWithRange:r];
}
@end
