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
        self.currentLevel = [[aDecoder decodeObjectForKey:@"currentLevel"] integerValue];
//        self.levelsCompleted = [aDecoder decodeObjectForKey:@"levelsCompleted"];
//        self.scores = [aDecoder decodeObjectForKey:@"scores"];
    }

    return self;
}

+ (instancetype) sharedGameData {
    static GameData *_sharedInstance = nil;
    static dispatch_once_t predicate;

    dispatch_once(&predicate, ^{
        _sharedInstance = [[self alloc] init];
        GameData *savedData = [GameData loadGame];
//        _sharedInstance.scores          = savedData.scores;
        _sharedInstance.currentScene    = savedData.currentScene;
        _sharedInstance.currentLevel    = savedData.currentLevel;
//        _sharedInstance.levelsCompleted = savedData.levelsCompleted;
    });

    return _sharedInstance;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:[GameData sharedGameData].currentScene forKey:@"currentScene"];
    [aCoder encodeObject:@([GameData sharedGameData].currentLevel) forKey:@"currentLevel"];
//    [aCoder encodeObject:[GameData sharedGameData].scores forKey:@"scores"];
//    [aCoder encodeObject:[GameData sharedGameData].levelsCompleted forKey:@"levelsCompleted"];
}

#pragma mark - Loading and Saving Methods
+ (GameData *)loadGame {
    // load existing scores or set up and empty array
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *path = [documentDirectory stringByAppendingPathComponent:@"GameData.plist"];
    NSFileManager *fileManager = [NSFileManager defaultManager];

    // Check if the file exists
    if (![fileManager fileExistsAtPath:path]) {
        // Create an empty file if it doesn't exist
        NSString *bundle;
        if ((bundle = [[NSBundle mainBundle] pathForResource:@"DefaultGameData" ofType:@"plist"])) {
            [fileManager copyItemAtPath:bundle toPath:path error:nil];
        }
    }

    NSData *rawData;
    if ((rawData = [NSData dataWithContentsOfFile:path])) {
        // If we get serialized data back from the path
        //  unarchive it and cast it to GameData
        GameData *data = [NSKeyedUnarchiver unarchiveObjectWithData:rawData];
        if (data) {
            return data;
        }
    }
    return nil;
}

- (void) save {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0), ^{
        // find the save directory
        NSData *savedData = [NSKeyedArchiver archivedDataWithRootObject:[GameData sharedGameData]];
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDirectory = [paths objectAtIndex:0];
        NSString *path = [documentsDirectory stringByAppendingPathComponent:@"GameData.plist"];

        [savedData writeToFile:path atomically:YES];
    });
}

@end
