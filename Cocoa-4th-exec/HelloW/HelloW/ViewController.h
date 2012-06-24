//
//  ViewController.h
//  HelloW
//
//  Created by liudongbao on 12-4-15.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (retain, nonatomic) IBOutlet UILabel *label;
@property (retain, nonatomic) IBOutlet UIButton *bul;
@property (retain, nonatomic) IBOutlet UIButton *bu2;
- (IBAction)click:(id)sender;
 
@end
