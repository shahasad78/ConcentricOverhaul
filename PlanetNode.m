//
//  PlanetNode.m
//  Concentric
//
//  Created by Jedd Goble on 11/2/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import "PlanetNode.h"
#import "PhysicsUtil.h"

@implementation PlanetNode

- (void)didMoveToSceneWithUserData:(NSDictionary *)userData {
    if (userData) {
        NSDictionary *planetDict;
        if ((planetDict = [userData objectForKey:kAsteroidProperty.field])) {
            NSLog(@"Data:\n%@", userData);
            CGRect fieldRect = [[planetDict objectForKey:kAsteroidProperty.fieldRect] CGRectValue];
            NSUInteger density = [[planetDict objectForKey:kAsteroidProperty.density] integerValue];
            
            }
        }
    }

}

+ (instancetype) createPlanetOfSize:(float)size andType:(PlanetType)type withGravityRadius:(CGFloat)radius {
    PlanetNode *planet = [self spriteNodeWithImageNamed:@"ringplanet2"];
    
    planet.xScale = size;
    planet.yScale = size;
    
    [planet setupPhysicsBodyWithGravityRadius:radius];
    
    SKShapeNode *gravityCircle = [SKShapeNode shapeNodeWithCircleOfRadius:radius];
    gravityCircle.fillColor = [SKColor darkGrayColor];
    gravityCircle.alpha = 0.25;
    gravityCircle.strokeColor = [SKColor whiteColor];
    [planet addChild:gravityCircle];
    
    return planet;
}


- (void) setupPhysicsBodyWithGravityRadius:(CGFloat)radius {
    
    UIImage *imageForTexture = [UIImage imageNamed:@"ringplanet2"];
    SKTexture *planetTexture = [SKTexture textureWithImage:imageForTexture];
    self.physicsBody = [SKPhysicsBody bodyWithTexture:planetTexture size:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    
    self.physicsBody.usesPreciseCollisionDetection = YES;
    
    SKFieldNode *planetGravityField = [SKFieldNode radialGravityField];
    planetGravityField.enabled = YES;
    planetGravityField.position = self.position;
    planetGravityField.strength = 35.0f;
    
    SKRegion *region = [[SKRegion alloc] initWithRadius:radius];
    planetGravityField.region = region;
    
    [self addChild:planetGravityField];
    
    self.physicsBody.categoryBitMask = CollisionCategoryBarrier;
    self.physicsBody.collisionBitMask = CollisionCategoryComet;
    self.physicsBody.contactTestBitMask = CollisionCategoryComet;
    
}


@end
