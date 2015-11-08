//
//  AsteroidNode.m
//  Concentric
//
//  Created by Jedd Goble on 11/3/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import "AsteroidNode.h"
#import "PhysicsUtil.h"

@implementation AsteroidNode

- (void) didMoveToSceneWithUserData:(NSDictionary *)userData {
    if (userData) {
        NSDictionary *fieldDict;
        if ((fieldDict = [userData objectForKey:kAsteroidProperty.field])) {
            NSLog(@"Data:\n%@", userData);
            CGRect fieldRect = [[fieldDict objectForKey:kAsteroidProperty.fieldRect] CGRectValue];
            NSUInteger density = [[fieldDict objectForKey:kAsteroidProperty.density] integerValue];
            NSArray *asteroidField = [[self class] createAsteroidFieldWithRect:fieldRect andDensity:density];
            for (AsteroidNode *node in asteroidField) {
                [self addChild:node];

            }
        }
    }
}

+ (instancetype) createAsteroidOfSize:(AsteroidSizeType)type {
    NSString *asteroidSize;
    NSInteger numberOfAsteroidsInType;
    
    
    if (type == AsteroidBig) {
        asteroidSize = @"big";
        numberOfAsteroidsInType = 4;
    } else if (type == AsteroidMed) {
        asteroidSize = @"med";
        numberOfAsteroidsInType = 2;
    } else if (type == AsteroidSmall) {
        asteroidSize = @"small";
        numberOfAsteroidsInType = 2;
    } else if (type == AsteroidTiny) {
        asteroidSize = @"tiny";
        numberOfAsteroidsInType = 2;
    }
    
    NSInteger asteroidNumber = [PhysicsUtil randomWithMin:1 andMax:numberOfAsteroidsInType + 1];
    NSString *asteroidName = [NSString stringWithFormat:@"meteorBrown_%@%li", asteroidSize, (long)asteroidNumber];
    
    AsteroidNode *asteroid = [self spriteNodeWithImageNamed:asteroidName];
    [asteroid setupPhysicsBody];
    [asteroid runAction:[asteroid wiggleAnimation]];
    
    return asteroid;
}

- (void) setupPhysicsBody {
    
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    
    
    self.physicsBody.dynamic = YES;
    
    self.physicsBody.categoryBitMask = CollisionCategoryBarrier;
    self.physicsBody.collisionBitMask = CollisionCategoryComet | CollisionCategoryBarrier;
    self.physicsBody.fieldBitMask = 0;
    
}

- (SKAction *) wiggleAnimation {

    NSInteger deltaX = [PhysicsUtil randomWithMin:-5 andMax:6];
    NSInteger deltaY = [PhysicsUtil randomWithMin:-5 andMax:6];
    NSInteger time = [PhysicsUtil randomWithMin:200 andMax:500];
    NSTimeInterval timeInterval = time / 100.0;
    
    CGVector leftVector = CGVectorMake(deltaX, deltaY);
    SKAction *shiftLeft = [SKAction moveBy:leftVector duration:timeInterval];
    
    CGVector rightVector = CGVectorMake(-deltaX, -deltaY);
    SKAction *shiftRight = [SKAction moveBy:rightVector duration:timeInterval];
    
    NSArray *wiggles = @[shiftLeft, shiftRight];
    SKAction *sequence = [SKAction sequence:wiggles];
    SKAction *repeater = [SKAction repeatActionForever:sequence];
    
    return repeater;
    
}

+ (NSArray *) createAsteroidFieldWithRect:(CGRect)box andDensity:(NSInteger)numberOfAsteroids {
    NSMutableArray *asteroids = [NSMutableArray new];
    
    for (int i = 0; i < numberOfAsteroids; i++) {
        CGPoint location;
        location.x = [PhysicsUtil randomWithMin:0 andMax:box.size.width] + box.origin.x;
        location.y = [PhysicsUtil randomWithMin:0 andMax:box.size.height] + box.origin.y;
        
        NSUInteger type = [PhysicsUtil randomWithMin:1 andMax:4];
        AsteroidNode *asteroid = [AsteroidNode createAsteroidOfSize:type];
        
        asteroid.position = location;
        
        [asteroids addObject:asteroid];
    }
    
    return asteroids;
    
}





@end
