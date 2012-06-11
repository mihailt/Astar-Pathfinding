Astar-Pathfinding
=================

example usage:

int cols = 8;
int rows = 8;
AStar * pathFinder = [[AStar alloc] initWithGrid:[[AStarGrid alloc] initWithCols:cols andRows:rows]];
AStarNode * start = [pathFinder.grid getNodeAtPosition:ccp(0,0)];
AStarNode * end = [pathFinder.grid getNodeAtPosition:ccp(7,7)];
[pathFinder.grid setStartNode:start];
[pathFinder.grid setStartNode:end];
if ([pathFinder findPath]) {
	// pathFinder.path now contains NSMutableArray with AStarNode objects you need to visit to get to end node
	// it's up to you  to move required object along the path
} else {
	// no path to end node
}


some configuration settings are in AStarConstants.h
and default heruistic type is set to Eclidian in Astar.m initWithGrid method


