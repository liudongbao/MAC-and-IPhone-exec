//
//  RanchForecastAppDelegate.h
//  RanchForecast
//
//  Created by  on 12-6-16.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface RanchForecastAppDelegate : NSObject <NSApplicationDelegate>{
    IBOutlet NSTableView *tableView;
    NSArray *classes;
}

@property (assign) IBOutlet NSWindow *window;

@end
