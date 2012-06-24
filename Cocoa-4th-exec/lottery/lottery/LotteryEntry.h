//
//  LotteryEntry.h
//  lottery
//
//  Created by liudongbao on 12-4-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LotteryEntry : NSObject {
    NSCalendarDate *entryDate; int firstNumber; int secondNumber;
}

- (void)setEntryDate:(NSCalendarDate *)date;
- (NSCalendarDate *)entryDate;
- (int)firstNumber;
- (int)secondNumber;
- (id)initWithEntryDate:(NSCalendarDate *)theDate;
@end