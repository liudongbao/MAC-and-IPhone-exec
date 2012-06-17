//
//  RootViewController.m
//  RanchForecastTouch
//
//  Created by  on 12-6-17.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import "RootViewController.h"
#import "ScheduleFetcher.h"
#import "ScheduleViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController
@synthesize fetchButton;
@synthesize activityIndicator;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [[self navigationItem] setTitle:@"Ranch Forecast"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [self setFetchButton:nil];
    [self setActivityIndicator:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}


- (IBAction)fetchClasses:(id)sender {
    
    [activityIndicator startAnimating];
    [fetchButton setEnabled:NO];
    ScheduleFetcher *fetcher = [[ScheduleFetcher alloc] init];
    [fetcher fetchClassesWithBlock:
     ^(NSArray *classes, NSError *error) {
         [fetchButton setEnabled:YES];
         [activityIndicator stopAnimating];
         if (classes) {
             ScheduleViewController *svc;
             svc = [[ScheduleViewController alloc]
                    initWithStyle:UITableViewStylePlain];
             [svc setClasses:classes];
             [self.navigationController pushViewController:svc
                                                  animated:YES];
         }
         else
         {
             UIAlertView *alert;
             alert = [[UIAlertView alloc]
                      initWithTitle:@"Error Fetching Classes"
                      message:[error localizedDescription]
                      delegate:nil
                      cancelButtonTitle:@"Dismiss"
                      otherButtonTitles:nil];
             [alert show];
         }
     }];
}
@end
