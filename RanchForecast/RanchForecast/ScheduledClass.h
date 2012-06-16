//
//  ScheduledClass.h
//  RanchForecast
//
//  Created by  on 12-6-16.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScheduledClass : NSObject{
    NSString *name;
    NSString *location;
    NSString *href;
    NSDate *begin;
}
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *location;
@property (nonatomic, copy) NSString *href;
@property (nonatomic, strong) NSDate *begin;
@end