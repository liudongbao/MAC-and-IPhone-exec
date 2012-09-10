//
//  HelloWorldLayer.m
//  cocos2d-2.x-ARC-iOS
//
//  Created by Steffen Itterheim on 27.04.12.
//  Copyright __MyCompanyName__ 2012. All rights reserved.
//


// Import the interfaces
#import "GameScene.h"

// Needed to obtain the Navigation Controller
#import "AppDelegate.h"

#pragma mark - HelloWorldLayer

// HelloWorldLayer implementation
@implementation GameScene

// Helper class method that creates a Scene with the HelloWorldLayer as the only child.
+(CCScene *) scene
{
	// 'scene' is an autorelease object.
	CCScene *scene = [CCScene node];
	
	// 'layer' is an autorelease object.
	GameScene *layer = [GameScene node];
	
	// add layer as a child to scene
	[scene addChild: layer];
	
	// return the scene
	return scene;
}

// on "init" you need to initialize your instance
-(id) init
{
	// always call "super" init
	// Apple recommends to re-assign "self" with the "super's" return value
	if( (self=[super init]) ) {
		
		// create and initialize a Label
		CCLabelTTF *label = [CCLabelTTF labelWithString:@"Hello ARC World" fontName:@"Marker Felt" fontSize:64];

		// ask director for the window size
		CGSize size = [[CCDirector sharedDirector] winSize];
	
		// position the label on the center of the screen
		label.position =  ccp( size.width /2 , size.height/2 );
		
		// add the label as a child to this Layer
		[self addChild: label];
		
		
		
		//
		// Leaderboards and Achievements
		//
		
		// Default font size will be 28 points.
		[CCMenuItemFont setFontSize:28];
		
		// Achievement Menu Item using blocks
		CCMenuItem *itemAchievement = [CCMenuItemFont itemWithString:@"Achievements" block:^(id sender) {
			
			
			GKAchievementViewController *achivementViewController = [[GKAchievementViewController alloc] init];
			achivementViewController.achievementDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:achivementViewController animated:YES];
			
		}
									   ];

		// Leaderboard Menu Item using blocks
		CCMenuItem *itemLeaderboard = [CCMenuItemFont itemWithString:@"Leaderboard" block:^(id sender) {
			
			
			GKLeaderboardViewController *leaderboardViewController = [[GKLeaderboardViewController alloc] init];
			leaderboardViewController.leaderboardDelegate = self;
			
			AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
			
			[[app navController] presentModalViewController:leaderboardViewController animated:YES];
			
		}
									   ];
		
		CCMenu *menu = [CCMenu menuWithItems:itemAchievement, itemLeaderboard, nil];
		
		[menu alignItemsHorizontallyWithPadding:20];
		[menu setPosition:ccp( size.width/2, size.height/2 - 50)];
		
		// Add the menu to the layer
		[self addChild:menu];

        CCLOG(@"%@: %@", NSStringFromSelector(_cmd), self);
        self.isAccelerometerEnabled = YES;
        player = [CCSprite spriteWithFile:@"alien.png"];
        [self addChild:player z:0 tag:1];
        CGSize screenSize = [[CCDirector sharedDirector] winSize];
        float imageHeight = [player texture].contentSize.height;
        player.position = CGPointMake(screenSize.width / 2, imageHeight / 2);
        [self scheduleUpdate];
        [self initSpiders];
        scoreLabel = [CCLabelTTF labelWithString:@"0" fontName:@"Arial" fontSize:48];
        scoreLabel.position = CGPointMake(screenSize.width / 2, screenSize.height);
        // Adjust the label's anchorPoint's y position to make it align with the top.
        scoreLabel.anchorPoint = CGPointMake(0.5f, 1.0f);
        // Add the score label with z value of -1 so it's drawn below everything else
        [self addChild:scoreLabel z:-1];
	}
    
	return self;
}

// on "dealloc" you need to release all your retained objects

#pragma mark GameKit delegate

-(void) achievementViewControllerDidFinish:(GKAchievementViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) leaderboardViewControllerDidFinish:(GKLeaderboardViewController *)viewController
{
	AppController *app = (AppController*) [[UIApplication sharedApplication] delegate];
	[[app navController] dismissModalViewControllerAnimated:YES];
}

-(void) accelerometer:(UIAccelerometer *)accelerometer
        didAccelerate:(UIAcceleration *)acceleration
{
    // controls how quickly velocity decelerates (lower = quicker to change direction)
    float deceleration = 0.4f;
    // determines how sensitive the accelerometer reacts (higher = more sensitive)
    float sensitivity = 6.0f;
    // how fast the velocity can be at most
    float maxVelocity = 100;
    // adjust velocity based on current accelerometer acceleration
    playerVelocity.x = playerVelocity.x * deceleration + acceleration.x * sensitivity;
    // we must limit the maximum velocity of the player sprite, in both directions
    if (playerVelocity.x > maxVelocity)
    {
        playerVelocity.x = maxVelocity;
    }
    else if (playerVelocity.x < - maxVelocity)
    {
        playerVelocity.x = - maxVelocity;
    }
}
-(void) update:(ccTime)delta
{
    // Keep adding up the playerVelocity to the player's position
    CGPoint pos = player.position;
    pos.x += playerVelocity.x;
    // The Player should also be stopped from going outside the screen
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    float imageWidthHalved = [player texture].contentSize.width * 0.5f;
     float leftBorderLimit = imageWidthHalved;
    float rightBorderLimit = screenSize.width - imageWidthHalved;
    // preventing the player sprite from moving outside the screen
    if (pos.x < leftBorderLimit)
    {
        pos.x = leftBorderLimit;
        playerVelocity = CGPointZero;
    }
    else if (pos.x > rightBorderLimit)
    {
        pos.x = rightBorderLimit;
        playerVelocity = CGPointZero;
    }
    // assigning the modified position back
    player.position = pos;
    [self checkForCollision];
    // Update the Score (Timer) once per second.
    totalTime += delta;
    int currentTime = (int)totalTime;
    if (score < currentTime)
    {
        score = currentTime;
        [scoreLabel setString:[NSString stringWithFormat:@"%i", score]];
    }
}
-(void) initSpiders
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    // using a temporary spider sprite is the easiest way to get the image's size
    CCSprite* tempSpider = [CCSprite spriteWithFile:@"spider.png"];
    float imageWidth = [tempSpider texture].contentSize.width;
    // Use as many spiders as can fit next to each other over the whole screen width.
    int numSpiders = screenSize.width / imageWidth;
    // Initialize the spiders array using alloc.
    spiders = [[CCArray alloc] initWithCapacity:numSpiders];
    for (int i = 0; i < numSpiders; i++)
    {
        CCSprite* spider = [CCSprite spriteWithFile:@"spider.png"];
        [self addChild:spider z:0 tag:2];
        // Also add the spider to the spiders array.
        [spiders addObject:spider];
    }
    // call the method to reposition all spiders
    [self resetSpiders];
}
-(void) resetSpiders
{
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    // Get any spider to get its image width
    CCSprite* tempSpider = [spiders lastObject];
    CGSize size = [tempSpider texture].contentSize;
    int numSpiders = [spiders count];
    for (int i = 0; i < numSpiders; i++)
    {
        // Put each spider at its designated position outside the screen
        CCSprite* spider = [spiders objectAtIndex:i];
        spider.position = CGPointMake(size.width * i + size.width * 0.5f, 
                                      screenSize.height + size.height);
        [spider stopAllActions];
    }
    // Unschedule the selector just in case. If it isn't scheduled it won't do anything.
    [self unschedule:@selector(spidersUpdate:)];
    // Schedule the spider update logic to run at the given interval.
    [self schedule:@selector(spidersUpdate:) interval:0.7f];
    // reset the moved spiders counter and spider move duration (affects speed)
    numSpidersMoved = 0;
    spiderMoveDuration = 4.0f;
}
-(void) spidersUpdate:(ccTime)delta
{
    // Try to find a spider which isn't currently moving.
    for (int i = 0; i < 10; i++)
    {
        int randomSpiderIndex = CCRANDOM_0_1() * [spiders count];
        CCSprite* spider = [spiders objectAtIndex:randomSpiderIndex];
        // If the spider isn't moving it won’t have any running actions.
        if ([spider numberOfRunningActions] == 0)
        {
            // This is the sequence which controls the spiders' movement
            [self runSpiderMoveSequence:spider];
            // Only one spider should start moving at a time.
            break;
        }
    }
}
-(void) runSpiderMoveSequence:(CCSprite*)spider
{
    // Slowly increase the spider speed over time.
    numSpidersMoved++;
    if (numSpidersMoved % 8 == 0 && spiderMoveDuration > 2.0f)
    {
        spiderMoveDuration -= 0.1f;
    }
    // This is the sequence which controls the spiders' movement.
    CGPoint belowScreenPosition = CGPointMake(spider.position.x, 
                                              -[spider texture].contentSize.height);
    CCMoveTo* move = [CCMoveTo actionWithDuration:spiderMoveDuration
                                         position:belowScreenPosition];
    CCCallFuncN* callDidDrop = [CCCallFuncN actionWithTarget:self
                                                    selector:@selector(spiderDidDrop:)];
    CCSequence* sequence = [CCSequence actions:move, callDidDrop, nil];
    [spider runAction:sequence];
}
-(void) spiderDidDrop:(id)sender
{
    // Make sure sender is actually of the right class.
    NSAssert([sender isKindOfClass:[CCSprite class]], @"sender is not a CCSprite!");
    CCSprite* spider = (CCSprite*)sender;
    // move the spider back up outside the top of the screen
    CGPoint pos = spider.position;
    CGSize screenSize = [[CCDirector sharedDirector] winSize];
    pos.y = screenSize.height + [spider texture].contentSize.height;
    spider.position = pos;
}
-(void) checkForCollision
{
    // Assumption: both player and spider images are squares.
    float playerImageSize = [player texture].contentSize.width;
    float spiderImageSize = [[spiders lastObject] texture].contentSize.width;
      float playerCollisionRadius = playerImageSize * 0.4f;
    float spiderCollisionRadius = spiderImageSize * 0.4f;
    // This collision distance will roughly equal the image shapes.
    float maxCollisionDistance = playerCollisionRadius + spiderCollisionRadius;
    int numSpiders = [spiders count];
    for (int i = 0; i < numSpiders; i++)
    {
        CCSprite* spider = [spiders objectAtIndex:i];
        if ([spider numberOfRunningActions] == 0)
        {
            // This spider isn't even moving so we can skip checking it.
            continue;
        }
        // Get the distance between player and spider.
        float actualDistance = ccpDistance(player.position, spider.position);
        // Are the two objects closer than allowed?
        if (actualDistance < maxCollisionDistance)
        {
            // Game Over (just restart the game for now)
            [self resetSpiders];
            break;
        }
    }
}
@end
