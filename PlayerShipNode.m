//
//  PlayerShipNode.m
//  Concentric
//
//  Created by Jedd Goble on 11/2/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import "PlayerShipNode.h"
#import "PhysicsUtil.h"

@interface PlayerShipNode ()

@property (nonatomic) SKShapeNode *trajectoryLine;

// Ship State Properties
@property (nonatomic) BOOL isDraggingShip;
@property (nonatomic) BOOL shipIsInMotion;
@property (nonatomic) BOOL didExplodeShip;

@end


@implementation PlayerShipNode

- (instancetype)initWithDict:(NSDictionary *)dict {
    if (self = [super init]) {
#warning need to implement plist parsing
    }
    return self;
}


- (void) setupPhysicsBody {
    UIImage *imageForTexture = [UIImage imageNamed:@"playerShip3_blue"];
    
    SKTexture *shipTexture = [SKTexture textureWithImage:imageForTexture];
    
    self.physicsBody = [SKPhysicsBody bodyWithTexture:shipTexture size:CGSizeMake(self.frame.size.width, self.frame.size.height)];
    
    self.physicsBody.mass = 0.05;
    self.physicsBody.usesPreciseCollisionDetection = YES;
    
    self.physicsBody.categoryBitMask = CollisionCategoryComet;
    self.physicsBody.collisionBitMask = CollisionCategoryBarrier;
    self.physicsBody.contactTestBitMask = CollisionCategoryGoal | CollisionCategoryBarrier;
    
}

#pragma mark - Child Node Methods
- (void) addUnderShipGlow {
    
    self.shipGlow = [SKSpriteNode spriteNodeWithImageNamed:@"shipglow"];
    self.shipGlow.zPosition = self.zPosition - 1;
    
    SKAction *fadeOutGlow = [SKAction fadeAlphaTo:0.4 duration:1.0];
    fadeOutGlow.timingMode = SKActionTimingEaseInEaseOut;
    SKAction *fadeInGlow = [SKAction fadeAlphaTo:0.8 duration:1.0];
    fadeInGlow.timingMode = SKActionTimingEaseInEaseOut;
    NSArray *actionArray = @[fadeOutGlow, fadeInGlow];
    SKAction *glowSequence = [SKAction sequence:actionArray];
    SKAction *repeater = [SKAction repeatActionForever:glowSequence];
    
    [self.shipGlow runAction:repeater];
    [self addChild:self.shipGlow];
    
}

- (void) removeUnderShipGlow {
    
    SKAction *fadeOut = [SKAction fadeAlphaTo:0.0 duration:0.5];
    
    [self.shipGlow runAction:fadeOut completion:^{
        [self.shipGlow removeFromParent];
    }];
    
}

- (void) turnWingLightsOn {
    self.wingLightLeft.hidden = NO;
    self.wingLightRight.hidden = NO;
    
    
}

- (void) turnWingLightsOff {
    self.wingLightLeft.hidden = YES;
    self.wingLightRight.hidden = YES;
}

- (void) fireThruster {
    self.thruster.hidden = NO;
}


#pragma mark - Animation Methods
- (SKAction *) suckShipInSpiral:(CGVector)currentVelocity {
    
    SKAction *shrink = [SKAction scaleTo:0.0 duration:2.0];

    return shrink;
    
}


#pragma mark - Trajectory Methods
- (CGVector) initialVelocityWithStartingPoint:(CGPoint)startPoint andEndPoint:(CGPoint)endPoint {
    CGFloat dragX = startPoint.x - endPoint.x;
    CGFloat dragY = startPoint.y - endPoint.y;
    CGFloat distanceDragged = sqrtf(powf(dragX, 2) + powf(dragY, 2));

    if (distanceDragged > 10) {
        return CGVectorMake(dragX / 5, dragY / 5);
    }

    return CGVectorMake(0, 0);

}

- (void) drawTrajectoryLine:(CGPoint)fingerPoint {

    CGPoint delta;
    delta.x = self.position.x - fingerPoint.x;
    delta.y = self.position.y - fingerPoint.y;

    CGPoint newEndpoint;
    newEndpoint.x = self.position.x + delta.x;
    newEndpoint.y = self.position.y + delta.y;

    CGMutablePathRef pathToDraw = CGPathCreateMutable();
    CGPathMoveToPoint(pathToDraw, NULL, self.position.x, self.position.y);
    CGPathAddLineToPoint(pathToDraw, NULL, newEndpoint.x, newEndpoint.y);

    CGFloat pattern[2];
    pattern[0] = 3.0;
    pattern[1] = 3.0;
    CGPathRef dashed = CGPathCreateCopyByDashingPath(pathToDraw, NULL, 0, pattern, 2);

    self.trajectoryLine.path = dashed;

    float angle = atan2f(delta.y, delta.x) + (M_PI * 1.5);

    NSLog(@"Point = (%g, %g)", fingerPoint.x, fingerPoint.y);
    self.zRotation = angle;
    
    
}

#pragma mark - Custom Event protocol Methods

- (void) didMoveToSceneWithUserData:(NSDictionary *)userData {

    // Enable user to touch ship
    self.userInteractionEnabled = YES;

    // --------------------------------------------------------------------
    // Add Child Node References
    // --------------------------------------------------------------------
    // Add Thruster
    NSString *thrusterName = [NSString stringWithFormat:@"%@", kNodeName.thruster];
    self.thruster = (SKSpriteNode *)[self childNodeWithName:thrusterName];

    // Add WingLights
    NSString *shipLightName = [NSString stringWithFormat:@"%@*", kNodeName.shipLight];
    __weak PlayerShipNode *weakSelf = self;
    [self enumerateChildNodesWithName:shipLightName usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        static BOOL leftLightIsSet = NO;
        if (leftLightIsSet) {
            weakSelf.wingLightLeft = (SKSpriteNode *)node;
        } else {
            weakSelf.wingLightRight = (SKSpriteNode *)node;
            leftLightIsSet = YES;
        }
    }];

    // Set Playership's Z-Position
    self.zPosition = kNodePositionShip;


    // Setup Trajectory Line
    self.trajectoryLine             = [SKShapeNode node];
    self.trajectoryLine.name        = @"TrajectoryLine";
    self.trajectoryLine.strokeColor = [SKColor whiteColor];
    [self addChild:self.trajectoryLine];
    self.trajectoryLine.zPosition   = kNodePositionTrajectoryLine;

    [self setupPhysicsBody];
    [self addUnderShipGlow];

}


#pragma mark - InteractNode protocol Methods
- (void) interact {

}


#pragma mark - UIResponder Event Methods
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (!self.isDraggingShip) {
        self.isDraggingShip = YES;
        [self turnWingLightsOn];
    }

    for (UITouch *touch in touches) {
        CGPoint touchPosition = [touch locationInNode:self.scene];

        if (self.isDraggingShip && !self.shipIsInMotion) {

            [self drawTrajectoryLine:touchPosition];
        }
    }

}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {

    for (UITouch *touch in touches) {
        CGPoint touchPosition = [touch locationInNode:self.scene];

        if (self.isDraggingShip) {
            [self drawTrajectoryLine:touchPosition];
        }
    }

}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    if (self.isDraggingShip && !self.shipIsInMotion) {

        self.shipIsInMotion = YES;

        [self turnWingLightsOff];

        for (UITouch *touch in touches) {

            CGPoint touchReleasePosition = [touch locationInNode:self.scene];

            CGVector initialVelocity = [self initialVelocityWithStartingPoint:self.position andEndPoint:touchReleasePosition];

            SKAction *launchImpulse = [SKAction applyImpulse:initialVelocity duration:0.1];

            [self removeUnderShipGlow];

            [self runAction:launchImpulse];

            [self fireThruster];

        }
    }

    self.trajectoryLine.path = nil;

    self.isDraggingShip = NO;

    self.userInteractionEnabled = NO;
}
















@end
