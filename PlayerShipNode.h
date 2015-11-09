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

// Ship State Properties
@property (nonatomic) BOOL isDraggingShip;
@property (nonatomic) BOOL shipIsInMotion;
@property (nonatomic) BOOL didExplodeShip;


- (CGVector) initialVelocityWithStartingPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint;

- (void) turnWingLightsOn;

- (void) turnWingLightsOff;

- (void) fireThruster;

- (SKAction *) suckShipInSpiral:(CGVector)currentVelocity;

- (void) removeUnderShipGlow;

@end
