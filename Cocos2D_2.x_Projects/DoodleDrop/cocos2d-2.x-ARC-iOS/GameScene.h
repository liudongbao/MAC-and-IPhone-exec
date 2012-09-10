//
//  HelloWorldLayer.h
//  cocos2d-2.x-ARC-iOS
//
//  Created by Steffen Itterheim on 27.04.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


#import <GameKit/GameKit.h>

// When you import this file, you import all the cocos2d classes
#import "cocos2d.h"

// HelloWorldLayer
@interface GameScene : CCLayer <GKAchievementViewControllerDelegate, GKLeaderboardViewControllerDelegate>
{
	CCSprite* player;
	CGPoint playerVelocity;
	
	NSMutableArray* spiders;
	float spiderMoveDuration;
	int numSpidersMoved;
	
	int score;
	CCNode<CCLabelProtocol>* scoreLabel;
    int totalTime;
}

// returns a CCScene that contains the HelloWorldLayer as the only child
+(CCScene *) scene;

@end
