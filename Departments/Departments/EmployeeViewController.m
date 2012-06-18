//
//  EmployeeViewController.m
//  Departments
//
//  Created by  on 12-6-18.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "EmployeeViewController.h"

@interface EmployeeViewController ()

@end

@implementation EmployeeViewController

- (id)init
{
    self = [super initWithNibName:@"EmployeeView"
                           bundle:nil];
    if (self) {
        [self setTitle:@"Employees"];
    }
    return self;
}

@end
