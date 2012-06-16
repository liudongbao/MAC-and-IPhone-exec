//
//  ScheduleFetcher.h
//  RanchForecast
//
//  Created by  on 12-6-16.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduleFetcher : NSObject <NSXMLParserDelegate> {
    NSMutableArray *classes;
    NSMutableString *currentString;
    NSMutableDictionary *currentFields;
    NSDateFormatter *dateFormatter;
}
// Returns an NSArray of ScheduledClass objects if successful.
// Returns nil on failure.
- (NSArray *)fetchClassesWithError:(NSError **)outError;
@end
