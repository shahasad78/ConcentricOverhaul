//
//  GameScene.m
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright (c) 2015 Shotty Shack Games. All rights reserved.
//

#import "GameScene.h"
#import "PlayerShipNode.h"
#import "PhysicsUtil.h"

@interface GameScene ()



@end


@implementation GameScene

#pragma mark - View Life Cycle Methods
-(void)didMoveToView:(SKView *)view {

    // TODO: Read Plist and get level specific data to pass to nodes

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

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
    
    for (UITouch *touch in touches) {
        CGPoint location = [touch locationInNode:self];
        }
}

#pragma mark - Render Sequence Methods
-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
