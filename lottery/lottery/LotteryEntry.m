//
//  LotteryEntry.m
//  lottery
//
//  Created by liudongbao on 12-4-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "LotteryEntry.h"

@implementation LotteryEntry

- (id)initWithEntryDate:(NSCalendarDate *)theDate
{
    if (![super init]) {
        return nil;
    }

    entryDate = theDate; firstNumber = random() % 100 + 1; secondNumber = random() % 100 + 1; return self;
}
-(id) init{
    return [self initWithEntryDate:[NSCalendarDate calendarDate]];
}

- (NSString *)description
{
    NSString *result;

    result = [[NSString alloc] initWithFormat:@"%@ = %d and %d", [entryDate descriptionWithCalendarFormat:@"%b %d %Y"], firstNumber, secondNumber];
    return result;
}

 

- (void)setEntryDate:(NSCalendarDate *)date
{
    entryDate = date;
}

- (NSCalendarDate *)entryDate
{
    return entryDate;
}

- (int)firstNumber
{
    return firstNumber;
}

- (int)secondNumber
{
    return secondNumber;
}

@end