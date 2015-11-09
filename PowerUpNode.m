//
//  PowerUpNode.m
//  Concentric
//
//  Created by Jedd Goble on 11/4/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import "PowerUpNode.h"
#import "PhysicsUtil.h"

@implementation PowerUpNode

- (void) didMoveToSceneWithUserData:(NSDictionary *)userData {
    [self setupPhysicsBody];
    [self runAction:[self wiggleAnimation]];
}

+ (instancetype) createOxygenTank {
    PowerUpNode *oxygenTank = [self spriteNodeWithImageNamed:@"o2tankwithglow"];
    oxygenTank.name = @"OxygenTank";
    
    oxygenTank.xScale = 0.5;
    oxygenTank.yScale = 0.5;
    
    [oxygenTank setupPhysicsBody];
    [oxygenTank runAction:[oxygenTank wiggleAnimation]];
    
    return oxygenTank;
}

- (void) setupPhysicsBody {
    
    self.physicsBody = [SKPhysicsBody bodyWithRectangleOfSize:self.size];
    
    self.physicsBody.affectedByGravity = NO;
    self.physicsBody.dynamic = NO;
    
    self.physicsBody.categoryBitMask = CollisionCategoryCoin;
    self.physicsBody.collisionBitMask = 0;
    self.physicsBody.contactTestBitMask = CollisionCategoryComet;
    self.physicsBody.fieldBitMask = 0;
    
}

- (SKAction *) wiggleAnimation {
    
    NSInteger deltaX = [PhysicsUtil randomWithMin:-3 andMax:4];
    NSInteger deltaY = [PhysicsUtil randomWithMin:-3 andMax:4];
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


@end
