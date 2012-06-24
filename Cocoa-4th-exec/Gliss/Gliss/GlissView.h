//
//  GlissView.h
//  Gliss
//
//  Created by  on 12-6-24.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GlissView : NSOpenGLView {
    IBOutlet NSMatrix *sliderMatrix;
    float lightX, theta, radius;
    int displayList;
}
- (IBAction)changeParameter:(id)sender;
@end
