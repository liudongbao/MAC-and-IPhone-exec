//
//  AppController.h
//  KVCFun
//
//  Created by liudongbao on 12-4-26.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject
{
    int fido;
}

@property(readwrite, assign) int fido;
-(IBAction)incrementFido:(id)sender;
@end
