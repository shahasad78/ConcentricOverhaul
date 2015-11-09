//
//  PlanetNode.h
//  Concentric
//
//  Created by Jedd Goble on 11/2/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

typedef enum : NSUInteger {
    PlanetRinged,
    PlanetEarthlike,
    PlanetRed,
} PlanetType;

@interface PlanetNode : SKSpriteNode <CustomNodeEvents>

+ (instancetype) createPlanetOfSize:(float)size andType:(PlanetType)type withGravityRadius:(CGFloat)radius;


@end
