//
//  ScheduleFetcher.h
//  RanchForecast
//
//  Created by  on 12-6-16.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^ScheduleFetcherResultBlock)(NSArray *classes,
                                           NSError *error);

@interface ScheduleFetcher : NSObject <NSXMLParserDelegate> {
@private
    NSMutableArray *classes;
    NSMutableString *currentString;
    NSMutableDictionary *currentFields;
    NSDateFormatter *dateFormatter;
    ScheduleFetcherResultBlock resultBlock;
    NSMutableData *responseData;
    NSURLConnection *connection;
}-
(void)fetchClassesWithBlock:(ScheduleFetcherResultBlock)theBlock;
@end
