//
//  SKScene+SKSLoader.h
//  Concentric
//
//  Created by Richard Martinez on 11/5/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "GameScene.h"

@interface GameScene (SKSLoader)

+ (instancetype)unarchiveFromFile:(NSString *)file;
+ (instancetype)loadLevel:(NSUInteger)levelNumber;

@end
