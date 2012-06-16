//
//  RanchForecastAppDelegate.m
//  RanchForecast
//
//  Created by  on 12-6-16.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "RanchForecastAppDelegate.h"
#import "ScheduleFetcher.h"
#import "ScheduledClass.h"
@implementation RanchForecastAppDelegate
@synthesize window;
- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    [tableView setTarget:self];
    [tableView setDoubleAction:@selector(openClass:)];
    ScheduleFetcher *fetcher = [[ScheduleFetcher alloc] init];
    NSError         *error;

    classes = [fetcher fetchClassesWithError:&error];
    [tableView reloadData];
}

- (void)openClass:(id)sender
{
    ScheduledClass *c = [classes objectAtIndex:
        [tableView clickedRow]];
    NSURL *baseUrl = [NSURL URLWithString:
        @"http://www.bignerdranch.com/"];
    NSURL *url = [NSURL URLWithString   :[c href]
                        relativeToURL   :baseUrl];

    [[NSWorkspace sharedWorkspace] openURL:url];
}

#pragma mark -
#pragma mark NSTableViewDataSource
- (NSInteger)numberOfRowsInTableView:(NSTableView *)theTableView
{
    return [classes count];
}

-
   (id) tableView                   :(NSTableView *)theTableView
        objectValueForTableColumn   :(NSTableColumn *)tableColumn
        row                         :(NSInteger)row
{
    ScheduledClass *c = [classes objectAtIndex:row];

    return [c valueForKey:[tableColumn identifier]];
}

@end