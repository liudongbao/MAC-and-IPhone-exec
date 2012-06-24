//
//  Document.h
//  RaiseMan
//
//  Created by liudongbao on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Person.h"

@interface RMDocument : NSDocument
{
    NSMutableArray              *employees;
    IBOutlet NSTableView        *tableView;
    IBOutlet NSArrayController  *employeeController;
}
- (void)setEmployees:(NSMutableArray *)a;

- (void)insertObject:(Person *)p inEmployeesAtIndex:(NSUInteger)index;
- (void)removeObjectFromEmployeesAtIndex:(NSUInteger)index;


- (IBAction)createEmployee:(id)sender;
- (IBAction)removeEmployee:(id)sender;
@end