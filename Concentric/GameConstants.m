//
//  GameConstants.m
//  Concentric
//
//  Created by Richard Martinez on 11/3/15.
//  Copyright © 2015 Digible. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GameConstants.h"


#pragma mark - Circle Constants

NSString *const kCircleNodeName = @"Circle";

// --------------------------------------------------------------------
//  kCircleGapWidth
// --------------------------------------------------------------------
const struct kCircleGapWidth kCircleGapWidth = {
    .innerCircleEasy    = (3.0f * M_PI) / 4.0f,
    .innerCircleMedium  = (M_PI) / 2.0f,
    .innerCircleHard    = (M_PI) / 3.0f,
    .outerCircleEasy    = (7.0f * M_PI) / 4.0f,
    .outerCircleMedium  = (3.0f * M_PI) / 2.0f,
    .outerCircleHard    = (4.0f * M_PI) / 3.0f,
};

// --------------------------------------------------------------------
//  kCircleAngularVelocity
// --------------------------------------------------------------------
const struct kCircleAngularVelocity kCircleAngularVelocity = {
    .easy   = M_PI/2,
    .medium = M_PI,
    .hard   = 2 * M_PI,
};

// --------------------------------------------------------------------
//  kCircleAnimationActionKey
// --------------------------------------------------------------------
const struct kCircleAnimationActionKey kCircleAnimationActionKey = {
    .rotateCircle   = @"RotateCircle",
    .fadeOut        = @"FadeOutCircle",
};

CGFloat const kCircleThickness = 20.0f;

// --------------------------------------------------------------------
//  kNodeNames
// --------------------------------------------------------------------
const struct kNodeName kNodeName = {
    .playerShip     = @"PlayerShip",
    .thruster       = @"Thruster",
    .shipLight      = @"ShipLight",
    .planet         = @"Planet",
    .asteroid       = @"Asteroid",
    .wormhole       = @"Wormhole",
    .rectangle      = @"Rectangle",
    .powerUp        = @"PowerUp",
    .trajectoryLine = @"TrajectoryLine",
};
// --------------------------------------------------------------------
// Asteroid Properties
// --------------------------------------------------------------------
NSString *const AsteroidPlistKey = @"AsteroidProperties";
const struct kAsteroidProperty kAsteroidProperty = {
    .field          = @"field",
    .fieldRect      = @"fieldRect",
    .density        = @"density",
    .asteroidType   = @"asteroidType",
};

// --------------------------------------------------------------------
// Planet Properties
// --------------------------------------------------------------------
const struct kPlanetProperty kPlanetProperty = {
    .gravityRadius  = @"gravityRadius",
    .planetType     = @"planetType",
};
// --------------------------------------------------------------------
//  kConcentricAsset
// --------------------------------------------------------------------
const struct kConcentricAsset kConcentricAsset = {
    .PlayerShipImage            = @"playerShip3_blue",
    .PlayerShipThrusterImage    = @"shiplights",
    .PlayerShipLightsImage      = @"thruster1",
};
