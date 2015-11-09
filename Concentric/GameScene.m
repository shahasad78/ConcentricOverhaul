//
//  GameScene.m
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright (c) 2015 Shotty Shack Games. All rights reserved.
//

#import "SKScene+SKSLoader.h"
#import "PlayerShipNode.h"
#import "PhysicsUtil.h"
#import "GameScene.h"

@interface GameScene ()

// Game entity properties
@property (nonatomic) PlayerShipNode *playerShip;

// Game State Properties
@property (nonatomic) BOOL isDraggingShip;
@property (nonatomic) BOOL isInteractingWithShape;
@property (nonatomic) BOOL isProcessingWin;
@property (nonatomic) BOOL isAnimatingIntoWormhole;
@property (nonatomic) BOOL didExplodeShip;

// Player properties
@property (nonatomic) NSUInteger oxygenLevel;

// Game UI properties
@property (nonatomic) SKShapeNode *trajectoryLine;
@property (nonatomic) SKSpriteNode *restartButton;


@end


@implementation GameScene

#pragma mark - View Life Cycle Methods
-(void)didMoveToView:(SKView *)view {

    self.gameData = [GameData sharedGameData];
    self.gameData.currentScene = @"Level1";
    self.gameData.currentLevel = 1;
    [self.gameData save];

    // Load the current Level Plist
    NSString *currentScene = self.gameData.currentScene;
    NSString *levelPath = [[NSBundle mainBundle] pathForResource:currentScene ofType:@"plist"];
    NSDictionary *dict = [NSDictionary dictionaryWithContentsOfFile:levelPath];
    // TODO: Read Plist dict    and get level specific data to pass to nodes


    // Setup PlayerShip and subscribe to its state changes
    self.playerShip = (PlayerShipNode *)[self childNodeWithName:[NSString stringWithFormat:@"//%@", kNodeName.playerShip]];
    [self.playerShip addObserver:self forKeyPath:@"isDraggingShip" options:NSKeyValueObservingOptionNew context:nil];

    [self enumerateChildNodesWithName:@"//*" usingBlock:^(SKNode * _Nonnull node, BOOL * _Nonnull stop) {
        if ([node conformsToProtocol:@protocol(CustomNodeEvents) ]) {
            if ([node.name isEqualToString:kNodeName.asteroid]) {
                NSValue *asteroidRect = [NSValue valueWithCGRect:CGRectMake(0, 0, 400, 400)];
                NSDictionary *asteroidDict = @{kAsteroidProperty.field:@{kAsteroidProperty.fieldRect:asteroidRect, kAsteroidProperty.density:@100 }};
                [(SKNode<CustomNodeEvents> *)node didMoveToSceneWithUserData:asteroidDict];
            } else {
                [(SKNode<CustomNodeEvents> *)node didMoveToSceneWithUserData:nil];
            }
        }
    }];

}

#pragma mark - Level Management Methods
- (void) newGame {
    [self.view presentScene:[GameScene loadLevel:self.currentLevel]];
}

#pragma mark - UIResponder Methods
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        }
}

#pragma mark - Render Loop Methods
-(void)update:(CFTimeInterval)currentTime {
//
//    CGVector velocity = self.playerShip.physicsBody.velocity;
//
//    if (!self.playerShip.isDraggingShip && !self.isProcessingWin) {
//
//        CGVector heading = self.playerShip.physicsBody.velocity;
//        float angle = atan2f(heading.dy, heading.dx) + (M_PI * 1.5);
//
//        self.playerShip.zRotation = angle;
//    } else if (self.isProcessingWin && (velocity.dx > 0.1 || velocity.dy > 0.1)) {
//
//        self.playerShip.physicsBody.velocity = CGVectorMake(velocity.dx * 0.9, velocity.dy * 0.9);
//
//
//    }
//
//    if (self.isProcessingWin && fabs(velocity.dx) < 0.1 && fabs(velocity.dy) < 0.1 && !self.isAnimatingIntoWormhole) {
//        self.isAnimatingIntoWormhole = YES;
//
//        [self.playerShip suckIntoWormhole];
//    }
//
//    if (self.playerShip.position.x < -50 || self.playerShip.position.x > self.size.width + 50 || self.playerShip.position.y < -50 || self.playerShip.position.y > self.size.height +50) {
//        [self gameOver];
//    }
//
//    self.oxygenLevel = self.oxygenLevel - 10;

}

#pragma mark - KVO Methods
- (void) observeValueForKeyPath:(NSString *)keyPath
                       ofObject:(id)object
                         change:(NSDictionary<NSString *,id> *)change
                        context:(void *)context {
    if ([keyPath isEqualToString:@"isDraggingShip"]) {
        self.isDraggingShip = [[change valueForKey:NSKeyValueChangeNewKey] boolValue];
    }
}

- (void) dealloc {
    [self.playerShip removeObserver:self forKeyPath:@"isDraggingShip"];
}

@end
