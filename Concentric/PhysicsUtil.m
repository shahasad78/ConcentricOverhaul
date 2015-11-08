//
//  PhysicsUtil.m
//  Concentric
//
//  Created by Jedd Goble on 11/2/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import "PhysicsUtil.h"

@implementation PhysicsUtil

+ (NSInteger) randomWithMin:(NSInteger)min andMax:(NSInteger)max {
    
    return arc4random() % (max - min) + min;
}

+ (CGVector)gravityValueFromString:(NSString *)gravityString {
    CGPoint gVal = CGPointFromString(gravityString);
    CGVector gravity = CGVectorMake(gVal.x, gVal.y);
    return gravity;
}

@end
