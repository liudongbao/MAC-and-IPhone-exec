//
//  AppController.m
//  KVCFun
//
//  Created by liudongbao on 12-4-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "AppController.h"

@implementation AppController

- (id)init
{
    [super init];
    [self setValue:[NSNumber numberWithInt:5] forKey:@"fido"];
    NSNumber *n = [self valueForKey:@"fido"];
    NSLog(@"fido = %@", n);
    return self;
}

@synthesize fido; 
-(IBAction)incrementFido:(id)sender{
    //NSNumber *n = [self valueForKey:@"fido"];
    //NSNumber *newN = [NSNumber numberWithInt: [n intValue]+1];
    //[self setValue:newN forKey:@"fido"];
    self.fido = self.fido+1;

}

@end