//
//  PlayerShipNode.h
//  Concentric
//
//  Created by Jedd Goble on 11/2/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"


@interface PlayerShipNode : SKSpriteNode <CustomNodeEvents, InteractiveNode>

@property (nonatomic) SKSpriteNode *wingLightLeft;
@property (nonatomic) SKSpriteNode *wingLightRight;
@property (nonatomic) SKSpriteNode *thruster;
@property (nonatomic) SKSpriteNode *shipGlow;


- (CGVector) initialVelocityWithStartingPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint;

- (void) turnWingLightsOn;

- (void) turnWingLightsOff;

- (void) fireThruster;

- (SKAction *) suckShipInSpiral:(CGVector)currentVelocity;

- (void) removeUnderShipGlow;

@end
