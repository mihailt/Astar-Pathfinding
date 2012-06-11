//
//  AStar.m
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AStar.h"

@implementation AStar

@synthesize open;
@synthesize closed;
@synthesize path;
@synthesize grid;
@synthesize straightCost;
@synthesize diagonalCost;
@synthesize heuristicType;

-(AStar *)initWithGrid:(AStarGrid *)g {
    self = [super init];
    if (self) {
        self.grid = g;
        self.diagonalCost = AS_COST_DIAGONAL;
        self.straightCost = AS_COST_STRAIGHT;
        self.heuristicType = EUCLIDIAN;
        self.open = [[NSMutableArray alloc] init];
        self.closed = [[NSMutableArray alloc] init];
        self.path = [[NSMutableArray alloc] init];        
    }
    return self;
}

-(BOOL)findPath {
    if (!grid.startNode || !grid.endNode) {
        return NO;
    }
    [open removeAllObjects];
    [closed removeAllObjects];
    [path removeAllObjects];
    grid.startNode.g = 0;
    grid.startNode.h = [self getHeruistic:grid.startNode];
    grid.startNode.f = grid.startNode.g + grid.startNode.h;
    return [self search];
}

-(BOOL)search {
    AStarNode * node = grid.startNode;
    while (![node isEqual:grid.endNode]) {
        int startX = fmax(0, node.position.x - 1);
        int endX = fmin(grid.numCols - 1, node.position.x + 1);
        int startY = fmax(0, node.position.y - 1);
        int endY = fmin(grid.numRows - 1, node.position.y + 1);
        
        for (int i = startX; i <= endX; i++) {
            for (int j = startY; j <= endY; j++) {
                AStarNode * test = [grid getNodeAtPosition:CGPointMake(i, j)];
                if ([test isEqual:node]) {
                    continue;
                } 
                if (!test.walkable) {
                   continue;
                }

                if (AS_DIAGONAL_ALLOWED == 0) {
                    if (test.position.x != node.position.x && test.position.y != node.position.y) {
                        continue;
                    }
                }

                double cost = straightCost;
                if(!((node.position.x == test.position.x) || (node.position.y == test.position.y))){
                    cost = diagonalCost;
                }
                double g =  node.g + cost * test.cost;
                double h = [self getHeruistic:test];
                double f = g + h;
                
                if ([self isOpen:test] || [self isClosed:test]) {
                    if(test.f > f)
                    {
                        test.f = f;
                        test.g = g;
                        test.h = h;
                        test.parentNode = node;
                    }                   
                } else {
                    test.f = f;
                    test.g = g;
                    test.h = h;
                    test.parentNode = node;
                    [open addObject:test];
                }
            }        
        }
        [closed addObject:node];
        if ([open count] == 0) {
            return NO;
        }

        [open sortUsingSelector:@selector(compareF:)];        
        node = [open objectAtIndex:0];
        [open removeObjectAtIndex:0];        
    }
    [self buildPath];
    return YES;
}
         
-(NSMutableArray *)buildPath {
    [path removeAllObjects];
    AStarNode * node = grid.endNode;
    while (![node isEqual:grid.startNode]) {
        [path addObject:node];
        node = node.parentNode;
    }
    return path;
}

-(double)getHeruistic:(AStarNode *)node {
    switch (heuristicType) {
        case DIAGONAL:
            return [self diagonal:node];
            break;
        case MANHATTAN:
            return [self manhattan:node];
            break;                     
        case EUCLIDIAN:            
            return [self euclidian:node];
            break;            
        default:
            return [self diagonal:node];
            break;
    }
}

-(double)manhattan:(AStarNode *)node {
    return fabs(node.position.x - grid.endNode.position.x) * straightCost + fabs(node.position.y - grid.endNode.position.y) * straightCost;
}

-(double)euclidian:(AStarNode *)node {
    double dx, dy;
    dx = node.position.x - grid.endNode.position.x;
    dy = node.position.y - grid.endNode.position.y;
    return sqrt(dx * dx + dy * dy);
}

-(double)diagonal:(AStarNode *)node {
    double dx, dy, diag, straight;
    dx = fabs(node.position.x - grid.endNode.position.x);
    dy = fabs(node.position.y - grid.endNode.position.y);
    diag = fmin(dx, dy);
    straight = dx + dy;
    return diagonalCost * diag + straightCost * (straight - 2 * diag);
}

-(BOOL)isOpen:(AStarNode *)node {
    for (AStarNode *n in open) {
        if ([n isEqual:node]) {
            return YES;
        }
    }
    return NO;
}

-(BOOL)isClosed:(AStarNode *)node {
    for (AStarNode *n in closed) {
        if ([n isEqual:node]) {
            return YES;
        }
    }
    return NO;
}

-(void) dealloc {
    [open release];
    [closed release];
    [path release];
    [grid release];
    [super dealloc];
}
@end
