//
//  GameData.m
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright © 2015 Shotty Shack Games. All rights reserved.
//

#import "GameData.h"

@implementation GameData

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.currentScene = [aDecoder decodeObjectForKey:@"currentScene"];
//        self.levelsCompleted = [aDecoder decodeObjectForKey:@"levelsCompleted"];
        self.scores = [aDecoder decodeObjectForKey:@"scores"];
    }

    return self;
}

+ (instancetype) sharedGameData {
    static GameData *_sharedInstance = nil;
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        _sharedInstance = [[self alloc] init];
    });

    return _sharedInstance;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    
}

@end
