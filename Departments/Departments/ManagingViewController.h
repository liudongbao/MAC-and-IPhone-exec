//
//  ManagingViewController.h
//  Departments
//
//  Created by  on 12-6-17.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ManagingViewController : NSViewController {
    NSManagedObjectContext *managedObjectContext;
}
@property (strong) NSManagedObjectContext *managedObjectContext;
@end
