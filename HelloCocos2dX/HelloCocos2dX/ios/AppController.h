//
//  HelloCocos2dXAppController.h
//  HelloCocos2dX
//
//  Created by liudongbao on 12-12-1.
//  Copyright __MyCompanyName__ 2012年. All rights reserved.
//

@class RootViewController;

@interface AppController : NSObject <UIAccelerometerDelegate, UIAlertViewDelegate, UITextFieldDelegate,UIApplicationDelegate> {
    UIWindow *window;
    RootViewController	*viewController;
}

@end

