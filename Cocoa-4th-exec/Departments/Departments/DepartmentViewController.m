//
//  DepartmentViewController.m
//  Departments
//
//  Created by  on 12-6-18.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "DepartmentViewController.h"

@implementation DepartmentViewController
- (id)init
{
    self = [super initWithNibName:@"DepartmentView"
                           bundle:nil];
    if (self) {
        [self setTitle:@"Departments"];
    }
    return self;
}
@end
