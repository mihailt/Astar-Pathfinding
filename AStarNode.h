//
//  AStarNode.h
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AStarConstants.h"
#import <Foundation/Foundation.h>

@interface AStarNode : NSObject {
    CGPoint position;
    double f;
    double g;
    double h;
    BOOL walkable;
    AStarNode * parentNode;
    double cost;
    id userData;
}

@property CGPoint position;
@property double f;
@property double g;
@property double h;
@property BOOL walkable;
@property (nonatomic, retain) AStarNode * parentNode;
@property double cost;

-(AStarNode *)initNodeAtPosition:(CGPoint)pos;
-(NSComparisonResult)compareF:(id)otherObject;
@end
