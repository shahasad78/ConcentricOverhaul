//
//  GameScene.h
//  Concentric
//

//  Copyright (c) 2015 Shotty Shack Games. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameData.h"

#pragma mark - Protocol Declarations

@protocol CustomNodeEvents <NSObject>


- (void) didMoveToSceneWithUserData:(NSDictionary  * _Nullable)userData;

@end

@protocol InteractiveNode <NSObject>

- (void) interact;

@end


#pragma mark - Class declaration

@interface GameScene : SKScene <SKPhysicsContactDelegate>

NS_ASSUME_NONNULL_BEGIN

// Level properties
@property (strong, nonatomic) NSString *currentScene;
@property (nonatomic) NSUInteger currentLevel;
@property (strong, nonatomic) GameData *gameData;

NS_ASSUME_NONNULL_END
@end
