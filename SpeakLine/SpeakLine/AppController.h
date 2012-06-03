//
//  AppController.h
//  SpeakLine
//
//  Created by liudongbao on 12-4-25.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppController : NSObject <NSSpeechSynthesizerDelegate>{
    IBOutlet NSTextField *textField;
    IBOutlet NSButton *stopButton;
    IBOutlet NSButton *startButton;
    IBOutlet NSTableView *tableView; 
    NSArray *voiceList;
    NSSpeechSynthesizer *speechSynth;
}
- (IBAction)sayIt:(id)sender;
- (IBAction)stopIt:(id)sender;
@end