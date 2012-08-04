//
//  ViewController.m
//  HelloWorld
//
//  Created by liudongbao on 12-7-29.
//  Copyright (c) 2012年 liudongbao. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize popoverController;
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // dismiss existing popover and release it
    if (self.popoverController)
    {
        [self.popoverController dismissPopoverAnimated:NO];
        self.popoverController = nil;
    }
    // retain the popover and set its content size
    if ([segue.identifier isEqualToString:@"basic pop"])
    {
        UIStoryboardPopoverSegue *popoverSegue =
        (UIStoryboardPopoverSegue *)segue;
        UIPopoverController *thePopoverController =
        [popoverSegue popoverController];
        UIViewController *contentVC =
        thePopoverController.contentViewController;
        contentVC.contentSizeForViewInPopover =
        CGSizeMake(320.0f, 320.0f);
        [thePopoverController setDelegate:self];
        self.popoverController = thePopoverController;
    }
}
// Release ownership of the popover when dismissed
- (void)popoverControllerDidDismissPopover:
(UIPopoverController *)thePopoverController
{
    self.popoverController = nil;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (IBAction)dismissModalController:(id)sender {
    [self dismissModalViewControllerAnimated:YES];
}
@end
