//
//  GameData.h
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright © 2015 Shotty Shack Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>

// Scene Properties
@property (strong, nonatomic) NSString *currentScene;
@property (nonatomic) NSUInteger currentLevel;
@property (strong, nonatomic) NSDictionary *sceneData;

// Global Data Properties
@property (nonatomic) NSDictionary<NSString*,NSNumber*> *scores;
@property (nonatomic) NSDictionary<NSString*,NSNumber*> *levelsCompleted;

+ (instancetype) sharedGameData;
- (void) save;

@end
