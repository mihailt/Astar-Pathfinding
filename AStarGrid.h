//
//  AStarGrid.h
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AStarConstants.h"
#import "AStarNode.h"
#import <Foundation/Foundation.h>

@interface AStarGrid : NSObject {
    AStarNode * startNode;
    AStarNode * endNode;
    NSMutableArray * nodes;    
    int numCols;
    int numRows;
}

@property (nonatomic, retain) AStarNode * startNode;
@property (nonatomic, retain) AStarNode * endNode;
@property (nonatomic, retain) NSMutableArray * nodes;
@property int numCols;
@property int numRows;

-(AStarGrid *)initWithCols:(int)cols andRows:(int)rows;
-(AStarNode *)getNodeAtPosition:(CGPoint)pos;
-(void)setStartNodePosition:(CGPoint)pos;
-(void)setEndNodePosition:(CGPoint)pos;

@end
