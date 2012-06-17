//
//  ScheduleViewController.h
//  RanchForecastTouch
//
//  Created by  on 12-6-17.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ScheduleViewController : UITableViewController {
    NSArray *classes;
    NSDateFormatter *dateFormatter;
}
@property (nonatomic, strong) NSArray *classes;
@end