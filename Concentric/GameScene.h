//
//  GameScene.h
//  Concentric
//

//  Copyright (c) 2015 Shotty Shack Games. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>


#pragma mark - Protocol Declarations

@protocol CustomNodeEvents <NSObject>


- (void) didMoveToSceneWithUserData:(NSDictionary  * _Nullable)userData;

@end

@protocol InteractiveNode <NSObject>

- (void) interact;

@end


#pragma mark - Class declaration

@interface GameScene : SKScene <SKPhysicsContactDelegate>

@end
