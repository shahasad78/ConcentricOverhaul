//
//  SKScene+SKSLoader.m
//  Concentric
//
//  Created by Richard Martinez on 11/5/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import "SKScene+SKSLoader.h"

@implementation GameScene (SKSLoader)

+ (instancetype)unarchiveFromFile:(NSString *)file {
    /* Retrieve scene file path from the application bundle */
    NSString *nodePath = [[NSBundle mainBundle] pathForResource:file ofType:@"sks"];
    /* Unarchive the file to an SKScene object */
    NSData *data = [NSData dataWithContentsOfFile:nodePath
                                          options:NSDataReadingMappedIfSafe
                                            error:nil];
    NSKeyedUnarchiver *arch = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
    [arch setClass:self forClassName:@"GameScene"];
    GameScene *scene = [arch decodeObjectForKey:NSKeyedArchiveRootObjectKey];
    [arch finishDecoding];

    return scene;
}


+ (instancetype)loadLevel:(NSUInteger)levelNumber {
    NSString *sceneName = [NSString stringWithFormat:@"Level%lu", levelNumber];
    GameScene *scene = [self nodeWithFileNamed:sceneName];
    scene.currentLevel = levelNumber;
    scene.currentScene = sceneName;
    scene.scaleMode = SKSceneScaleModeAspectFill;
    return scene;
}


@end
