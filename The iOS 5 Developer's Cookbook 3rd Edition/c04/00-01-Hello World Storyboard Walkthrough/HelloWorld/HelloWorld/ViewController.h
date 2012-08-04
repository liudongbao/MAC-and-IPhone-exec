//
//  ViewController.h
//  HelloWorld
//
//  Created by liudongbao on 12-7-29.
//  Copyright (c) 2012年 liudongbao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIPopoverControllerDelegate>
// from prior walk-through
- (IBAction)dismissModalController:(id)sender;
// retain the popover during its lifetime
@property (strong) UIPopoverController *popoverController;
@end

