//
//  Score.h
//  Concentric
//
//  Created by Richard Martinez on 11/8/15.
//  Copyright © 2015 Shotty Shack Games. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Score : NSObject <NSCoding>

@property (nonatomic) NSUInteger score;
@property (nonatomic) NSDate *dateOfScore;

@end
