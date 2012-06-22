//
//  Department.h
//  Departments
//
//  Created by  on 12-6-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Department : NSManagedObject

@property (nonatomic, retain) NSString * deptName;
@property (nonatomic, retain) NSSet *employees;
@property (nonatomic, retain) NSManagedObject *manager;
@end

@interface Department (CoreDataGeneratedAccessors)

- (void)addEmployeesObject:(NSManagedObject *)value;
- (void)removeEmployeesObject:(NSManagedObject *)value;
- (void)addEmployees:(NSSet *)values;
- (void)removeEmployees:(NSSet *)values;

@end
