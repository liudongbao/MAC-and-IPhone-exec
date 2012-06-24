//
//  PeopleView.h
//  RaiseMan
//
//  Created by  on 12-6-16.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface PeopleView : NSView {
    NSArray *people;
    NSMutableDictionary *attributes;
    float lineHeight;
    NSRect pageRect;
    NSInteger linesPerPage;
    NSInteger currentPage;
}-
(id)initWithPeople:(NSArray *)array;
@end
