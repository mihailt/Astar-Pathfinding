//
//  AStar.h
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AStarConstants.h"
#import "AStarNode.h"
#import "AStarGrid.h"
#import <Foundation/Foundation.h>

@interface AStar : NSObject {
    NSMutableArray * open;
    NSMutableArray * closed;
    NSMutableArray * path;
    AStarGrid * grid;
    double straightCost;
    double diagonalCost;
    heuristic heuristicType;
}

@property (nonatomic, retain) NSMutableArray * open;
@property (nonatomic, retain) NSMutableArray * closed;
@property (nonatomic, retain) NSMutableArray * path;
@property (nonatomic, retain) AStarGrid * grid;
@property double straightCost;
@property double diagonalCost;
@property heuristic heuristicType;

-(AStar *)initWithGrid:(AStarGrid *)g;
-(BOOL)findPath;
-(BOOL)search;
-(NSMutableArray *)buildPath;
-(double)getHeruistic:(AStarNode *)node;
-(double)manhattan:(AStarNode *)node;
-(double)euclidian:(AStarNode *)node;
-(double)diagonal:(AStarNode *)node;
-(BOOL)isOpen:(AStarNode *)node;
-(BOOL)isClosed:(AStarNode *)node;

@end
