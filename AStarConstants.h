//
//  AStarConstants.h
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#define AS_COST_STRAIGHT 1.0
#define AS_COST_DIAGONAL 1.414
#define AS_COST_MULTIPLIER 1.0
#define AS_DIAGONAL_ALLOWED 0

typedef enum {
    MANHATTAN = 0,
    EUCLIDIAN = 1,
    DIAGONAL = 2,
} heuristic;