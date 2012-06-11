//
//  AStarGrid.m
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AStarGrid.h"

@implementation AStarGrid

@synthesize startNode;
@synthesize endNode;
@synthesize nodes;
@synthesize numCols;
@synthesize numRows;

-(AStarGrid *)initWithCols:(int)cols andRows:(int)rows {
    self = [super init];
    if (self) {
        self.nodes = [[NSMutableArray alloc] init];
        self.numCols = cols;
        self.numRows = rows;
        
        for (int c= 0; c < self.numCols; c++) {
            NSMutableArray * collumn = [[NSMutableArray alloc] init];
            for (int r= 0; r < self.numRows; r++) {
                AStarNode * node = [[AStarNode alloc] initNodeAtPosition:CGPointMake(c, r)];
                [collumn addObject:node];
            }
            [nodes addObject:collumn];
        }
    }
    return self;
}

-(AStarNode *)getNodeAtPosition:(CGPoint)pos {
    return [[self.nodes objectAtIndex:pos.x] objectAtIndex:pos.y];
}

-(void)setStartNodePosition:(CGPoint)pos {
    self.startNode = [self getNodeAtPosition:pos];
}

-(void)setEndNodePosition:(CGPoint)pos {
    self.endNode = [self getNodeAtPosition:pos];
}

-(void) dealloc {
    [startNode release];
    [endNode release];
    [nodes release];

    [super dealloc];
}

@end
