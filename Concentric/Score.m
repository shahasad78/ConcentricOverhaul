//
//  Score.m
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright © 2015 Shotty Shack Games. All rights reserved.
//

#import "Score.h"

@implementation Score

- (instancetype) initWithScore:(NSUInteger)score andDateOfScore:(NSDate *)date {
    if (self = [super init]) {
        self.score = score;
        self.dateOfScore = date;
    }
    return self;
}

- (instancetype) initWithCoder:(NSCoder *)aDecoder {
    if (self = [super init]) {
        self.score          = [[aDecoder decodeObjectForKey:@"score"] integerValue];
        self.dateOfScore    = [aDecoder decodeObjectForKey:@"dateOfScore"];
    }
    return self;
}

- (void) encodeWithCoder:(NSCoder *)aCoder {
    [aCoder encodeObject:@(self.score) forKey:@"score"];
    [aCoder encodeObject:self.dateOfScore forKey:@"dateOfScore"];
}

@end
