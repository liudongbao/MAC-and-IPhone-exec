//
//  TutorController.h
//  TypingTutor
//
//  Created by 冬宝 刘冬宝 on 12-6-12.
//  Copyright (c) 2012年 derrik.org. All rights reserved.
//

#import <Cocoa/Cocoa.h>
@class BigLetterView;
@interface TutorController : NSObject {
    // Outlets
    IBOutlet BigLetterView *inLetterView;
    IBOutlet BigLetterView *outLetterView;
    IBOutlet NSWindow *speedSheet;
    // Data
    NSArray *letters;
    int lastIndex;
    // Time
    NSTimeInterval startTime;
    NSTimeInterval elapsedTime;
    NSTimeInterval timeLimit;
    NSTimer *timer;
}-
(IBAction)stopGo:(id)sender;
- (IBAction)showSpeedSheet:(id)sender;
- (IBAction)endSpeedSheet:(id)sender;
- (void)updateElapsedTime;
- (void)resetElapsedTime;
- (void)showAnotherLetter;
@end
