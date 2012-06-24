//
//  Person.h
//  RaiseMan
//
//  Created by liudongbao on 12-4-27.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject<NSCoding>
{NSString   *personName;
 float      expectedRaise; }
@property (readwrite, copy) NSString    *personName;
@property (readwrite) float             expectedRaise;
 
@end