//
//  main.m
//  GameSalad Viewer
//
//  Created by Dan Treiman on 10/28/10.
//  Copyright 2010 GameSalad Inc. All rights reserved.
//



//  Note: main.m's file type is set to objc-c++ to make XCode link with standard c++ libraries


#import <UIKit/UIKit.h>


// 'forward' declare these indirectly references classes to avoid
// compiler warnings
@interface GameSaladAppDelegate : NSObject
@end

@interface GameListTableViewController : UITableViewController
@end

@interface GSUIProgressIndicator : UIView
@end


int main(int argc, char *argv[]) {
    // force classes that are indirectly referenced only to load
	[GameSaladAppDelegate class];
	[GameListTableViewController class];
	[GSUIProgressIndicator class];
    NSAutoreleasePool * pool = [[NSAutoreleasePool alloc] init];
    int retVal = UIApplicationMain(argc, argv, nil, @"GameSaladAppDelegate");
    [pool release];
    return retVal;
}
