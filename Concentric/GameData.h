//
//  GameData.h
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright © 2015 Shotty Shack Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GameData : NSObject <NSCoding>

@property (strong, nonatomic, readonly) GameData *sharedGameData;

// Scene Properties
@property (strong, nonatomic) NSString *currentScene;

// Global Data Properties
@property (nonatomic) NSArray<NSNumber *> *scores;
@property (nonatomic) NSDictionary<NSString*,NSNumber*> *levelsCompleted;



@end
