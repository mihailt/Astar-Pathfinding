//
//  AStarNode.m
//  AStar
//
//  Created by Mihails Tumkins on 11/29/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "AStarNode.h"

@implementation AStarNode

@synthesize position;
@synthesize f;
@synthesize g;
@synthesize h;
@synthesize walkable;
@synthesize parentNode;
@synthesize cost;

-(AStarNode *)initNodeAtPosition:(CGPoint)pos {
    self = [super init];
    if (self) {
        [self setPosition:pos];
        [self setWalkable:YES];
        [self setCost:AS_COST_MULTIPLIER];
    }
    return self;
}

-(NSString *) description {
    return [NSString stringWithFormat:@"x:%i y:%i walkable:%i f:%d",(int)self.position.x, (int)self.position.y, self.walkable, self.f];
	//return [NSString stringWithFormat:@"x:%i\ny:%i\nf:%i\ng:%i\nh:%i\nparent: %@\n",
	//		(int)self.position.x, (int)self.position.y, (int)self.f, (int)self.g, (int)self.h, self.parentNode];
}

-(NSComparisonResult)compareF:(id)otherObject {
    AStarNode * n1 = (AStarNode *)self;
    AStarNode * n2 = (AStarNode *)otherObject;
    if (n1.f > n2.f) {
        return NSOrderedDescending;
    } else if (n1.f < n2.f) {
        return NSOrderedAscending;    
    } else {
            return NSOrderedSame;
    }
}

-(void) dealloc {
    [parentNode release];
    [super dealloc];
}

@end
