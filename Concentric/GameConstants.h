//
//  GameConstants.h
//  Concentric
//
//  Created by Richard Martinez on 11/3/15.
//  Copyright © 2015 Digible. All rights reserved.
//

@import SpriteKit;


#pragma mark - Circle Constants

#pragma mark Circle's Physical Properties

/*!
 * @constant kCircleNodeName
 * @abstract NSString name property
 * @updated 11-03-2015
 */
extern NSString *const kCircleNodeName;

// --------------------------------------------------------------------
// CIRCLE PHYSICAL PROPERTIES
// --------------------------------------------------------------------

/*!
 * @typedef CircleGapWidth
 * @abstract typedef representing width values for the gap in Circle object.
 * @updated 11-03-2015
 */
typedef CGFloat CircleGapWidth;

/*!
 * @namespace kCircleGapWidth
 * @abstract Specifies various widths for the gap in our circle object. Values can be easy, medium and hard.
 * @updated 11-03-2015
 */
extern const struct kCircleGapWidth {
    CircleGapWidth innerCircleEasy;
    CircleGapWidth innerCircleMedium;
    CircleGapWidth innerCircleHard;
    CircleGapWidth outerCircleEasy;
    CircleGapWidth outerCircleMedium;
    CircleGapWidth outerCircleHard;
} kCircleGapWidth;

/*!
 * @constant kCircleNodeName
 * @abstract NSString name property
 * @updated 11-03-2015
 */
extern CGFloat const kCircleThickness;

#pragma mark Circle's Animation Properties
// --------------------------------------------------------------------
// CIRCLE ANIMATION PROPERTIES
// --------------------------------------------------------------------
/*!
 * @typedef CircleVelocity
 * @abstract Specifies various widths for the gap in our circle object. Values can be easy, medium and hard.
 * @updated 11-03-2015
 */
typedef CGFloat CircleVelocity;

/*!
 * @namespace kCircleAngularVelocity
 * @abstract Used to set the speed of the circle's rotation. Values can be easy, medium and hard.
 * @updated 11-03-2015
 */
extern const struct kCircleAngularVelocity {
    CircleVelocity easy;
    CircleVelocity medium;
    CircleVelocity hard;
} kCircleAngularVelocity;

/*!
 * @typedef CircleAnimationType
 * @abstract A typedef for the __unsafe_unretained NSString *const strings used as keys in kCircleAnimationActionKey
 * @updated 11-03-2015
 */
typedef __unsafe_unretained NSString *const CircleAnimationType;

/*!
 * @namespace kCircleAnimationActionKey
 * @abstract Contains the names of the SKAction keys applied to a circle. Keys can be used to retrieve and cancel an animation.
 * @updated 11-03-2015
 */
extern const struct kCircleAnimationActionKey {
    CircleAnimationType rotateCircle;
    CircleAnimationType fadeOut;
} kCircleAnimationActionKey;

#pragma mark - Asteroid Constants
// --------------------------------------------------------------------
// Asteroid User Data Constants
// --------------------------------------------------------------------
/*!
 * @typedef AsteroidPropertyType
 * @abstract A typedef for the __unsafe_unretained NSString *const strings used as keys in initializing an Asteroid's properties in didMoveToSceneWithUserData:
 * @updated 11-08-2015
 */
typedef __unsafe_unretained NSString *const AsteroidPropertyType;

NSString *const AsteroidPlistKey = @"AsteroidProperties";

/*!
 * @namespace kCircleAnimationActionKey
 * @abstract Contains the names of the SKAction keys applied to a circle. Keys can be used to retrieve and cancel an animation.
 * @updated 11-03-2015
 */
extern const struct kAsteroidProperty {
    AsteroidPropertyType field;
    AsteroidPropertyType fieldRect;
    AsteroidPropertyType density;
    AsteroidPropertyType asteroidType;
} kAsteroidProperty;


#pragma mark - Z Position Constants

/*!
 * @enum NodePosition
 * @abstract Assign Unique Z Position to various game objects
 * @constant kNodePositionBackground Position of background image
 * @constant kNodePositionWormhole
 * @constant kNodePositionVortex
 * @constant kNodePositionAsteroid
 * @constant kNodePositionPlanet
 * @constant kNodePositionCircle
 * @constant kNodePositionShip
 * @updated 11-03-2015
 */

typedef NS_ENUM(NSUInteger, NodePosition) {
    kNodePositionBackground = 0,
    kNodePositionWormhole,
    kNodePositionVortex,
    kNodePositionAsteroid,
    kNodePositionPlanet,
    kNodePositionCircle,
    kNodePositionTrajectoryLine,
    kNodePositionEffects,
    kNodePositionPowerUp,
    kNodePositionShip,
    kNodePositionHUD,
    kNodePauseScreen,
    kNodePauseHUDItem,
};

typedef __unsafe_unretained NSString *const ConcentricNodeName;
/*!
 * @namespace kNodeNames
 * @abstract Used to hold the names of nodes.
 * @updated 11-04-2015
 */
extern const struct kNodeName {
    ConcentricNodeName playerShip;
    ConcentricNodeName thruster;
    ConcentricNodeName shipLight;
    ConcentricNodeName rectangle;
    ConcentricNodeName planet;
    ConcentricNodeName asteroid;
    ConcentricNodeName wormhole;
    ConcentricNodeName trajectoryLine;
} kNodeName;

#pragma mark - Assets Constants

typedef __unsafe_unretained NSString *const ConcentricAsset;

/*!
 * @namespace kConcentricAsset
 * @abstract Used to hold the names of game assets.
 * @updated 11-04-2015
 */
extern const struct kConcentricAsset {
    ConcentricAsset PlayerShipImage;
    ConcentricAsset PlayerShipThrusterImage;
    ConcentricAsset PlayerShipLightsImage;
} kConcentricAsset;

/*!
 * @namespace kConcentricPlistKey
 * @abstract Used to hold the Plist Keys for game assets.
 * @updated 11-04-2015
 */
extern const struct kConcentricPlistKey {
    ConcentricAsset PlayerShipImage;
    ConcentricAsset PlayerShipThrusterImage;
    ConcentricAsset PlayerShipLightsImage;
    ConcentricAsset PlayerShipExplosionAtlas;
} kConcentricPlistKey;


#pragma mark - Physics Constants
/*!
 * @typedef CollisionCategory
 * @abstract Specifies various widths for the gap in our circle object. Values can be easy, medium and hard.
 * @updated 11-03-2015
 */
typedef NS_OPTIONS(uint32_t, CollisionCategory) {
    CollisionCategoryNone       = 0x0,
    CollisionCategoryComet      = 0x1 << 0,
    CollisionCategoryBarrier    = 0x1 << 1,
    CollisionCategoryGoal       = 0x1 << 2,
    CollisionCategoryCoin       = 0x1 << 3,
};