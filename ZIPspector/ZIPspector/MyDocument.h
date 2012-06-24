//
//  MyDocument.h
//  ZIPspector
//
//  Created by  on 12-6-24.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MyDocument : NSDocument
{
    IBOutlet NSTableView *tableView;
    NSArray *filenames;
}@
end
