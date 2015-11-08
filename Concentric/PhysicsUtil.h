//
//  PhysicsUtil.h
//  Concentric
//
//  Created by Jedd Goble on 11/2/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameConstants.h"


@interface PhysicsUtil : NSObject

+ (NSInteger) randomWithMin:(NSInteger)min andMax:(NSInteger)max;
+ (CGVector)gravityValueFromString:(NSString *)gravityString;

@end