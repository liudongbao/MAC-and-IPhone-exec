//
//  Employee.h
//  Departments
//
//  Created by  on 12-6-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Department;
@interface Employee : NSManagedObject {
@private
}@
property (nonatomic, copy) NSString *firstName;
@property (nonatomic, copy) NSString *lastName;
@property (nonatomic, retain) Department *department;
@property (nonatomic, readonly) NSString *fullName;
@end
