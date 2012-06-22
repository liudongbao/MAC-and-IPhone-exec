//
//  Department.m
//  Departments
//
//  Created by  on 12-6-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//
#import "Department.h"
#import "Employee.h"
@implementation Department

@dynamic deptName;
@dynamic employees;
@dynamic manager;
 
- (void)addEmployeesObject:(Employee *)value
{
    NSLog(@"Dept %@ adding employee %@",
          [self deptName], [value fullName]);
    NSSet *s = [NSSet setWithObject:value];
    [self willChangeValueForKey:@"employees"
                withSetMutation:NSKeyValueUnionSetMutation
                   usingObjects:s];
    [[self primitiveValueForKey:@"employees"] addObject:value];
    [self didChangeValueForKey:@"employees"
               withSetMutation:NSKeyValueUnionSetMutation
                  usingObjects:s];
}-
(void)removeEmployeesObject:(Employee *)value
{
    NSLog(@"Dept %@ removing employee %@",
          [self deptName], [value fullName]);
    Employee *manager = (Employee *)[self manager];
    if (manager == value) {
        [self setManager:nil];
    }
    NSSet *s = [NSSet setWithObject:value];
    [self willChangeValueForKey:@"employees"
                withSetMutation:NSKeyValueMinusSetMutation
                   usingObjects:s];
    [[self primitiveValueForKey:@"employees"] removeObject:value];
    [self didChangeValueForKey:@"employees"
               withSetMutation:NSKeyValueMinusSetMutation
                  usingObjects:s];
}
@end
