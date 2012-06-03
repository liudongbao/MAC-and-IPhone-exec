//
//  AppController.h
//  RaiseMan
//
//  Created by 冬宝 刘 on 12-5-20.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Foundation/Foundation.h>
@class PreferenceController;
@interface AppController : NSObject{
    PreferenceController *preferenceController;
}
- (IBAction)showPreferencePanel:(id)sender;
@end
