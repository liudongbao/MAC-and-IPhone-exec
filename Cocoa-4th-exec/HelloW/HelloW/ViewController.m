//
//  ViewController.m
//  HelloW
//
//  Created by liudongbao on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize label;
@synthesize bul;
@synthesize bu2;
 

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [self setLabel:nil];
    [self setBul:nil];
    [self setBu2:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [label release];
    [bul release];
    [bu2 release];
    [super dealloc];
}
- (IBAction)click:(id)sender {
    label.text =[sender titleForState:UIControlStateNormal];
}
@end
