//
//  AsteroidNode.h
//  Concentric
//
//  Created by Jedd Goble on 11/3/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

typedef enum : NSUInteger {
    AsteroidBig,
    AsteroidMed,
    AsteroidSmall,
    AsteroidTiny,
} AsteroidSizeType;

@interface AsteroidNode : SKSpriteNode <CustomNodeEvents>

+ (instancetype) createAsteroidOfSize:(AsteroidSizeType)type;

+ (NSArray *) createAsteroidFieldWithRect:(CGRect)box andDensity:(NSInteger)numberOfAsteroids;

@end
