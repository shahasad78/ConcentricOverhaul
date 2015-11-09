//
//  PowerUpNode.h
//  Concentric
//
//  Created by Jedd Goble on 11/4/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@interface PowerUpNode : SKSpriteNode <CustomNodeEvents>

+ (instancetype) createOxygenTank;

@end
