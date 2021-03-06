//
//  nonoTests.m
//  nonoTests
//
//  Created by Charles Francoise on 5/28/13.
//  Copyright (c) 2013 Charles Francoise. All rights reserved.
//

#import "nonoTests.h"
#import "NonoGrid.h"
#import "NonoColor.h"
#import "NonoSolver.h"

@implementation nonoTests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void)testIsEqualToGrid
{
    NonoGrid* grid1 = [NonoGrid debugGrid];
    NonoGrid* grid2 = [NonoGrid debugGrid];
    if (![grid1 isEqualToGrid:grid2])
    {
        STFail(@"Debug grids are not equal.");
    }
}

- (void)testColEntries
{
    NonoGrid* grid = [NonoGrid debugGrid];
    NSArray* colEntries = [grid getColEntries];
    STFail(@"TODO - add X entries test");
}

- (void)testRowEntries
{
    NonoGrid* grid = [NonoGrid debugGrid];
    NSArray* rowEntries = [grid getRowEntries];
    STFail(@"TODO - add Y entries test.");
}

- (void)testIsSolvedByGrid
{
    NonoGrid* grid = [NonoGrid debugGrid];
    NonoSolver* solver = [[[NonoSolver alloc] initWithColEntries:[grid getColEntries] andRowEntries:[grid getRowEntries]] autorelease];
    STAssertTrue([solver isSolvedByGrid:grid], @"Debug grid does not solve itself.");
}

/*- (void)testIsSolvedByGridRandom
{
    // Test with a hundred thousand random grids
    for (NSUInteger i = 0; i < 1E5; i++)
    {
        @autoreleasepool
        {
            NonoGrid* grid = [NonoGrid randomGrid];
            NonoSolver* solver = [[NonoSolver alloc] initWithColEntries:[grid getColEntries] andRowEntries:[grid getRowEntries]];
            STAssertTrue([solver isSolvedByGrid:grid], @"Random grid does not solve itself.");
        }
    }
}*/

- (void)testSolveDebug
{
    NonoGrid* grid = [NonoGrid debugGrid];
    NonoSolver* solver = [[[NonoSolver alloc] initWithColEntries:[grid getColEntries] andRowEntries:[grid getRowEntries]] autorelease];
    NonoGrid* solution = [solver solve];
    STAssertTrue([grid isEqualToGrid:solution], @"Solution does is not equal to debug grid.");
}


- (void)testSolveRandom
{
    NonoGrid* grid = [NonoGrid randomGrid];
    NonoSolver* solver = [[[NonoSolver alloc] initWithColEntries:[grid getColEntries] andRowEntries:[grid getRowEntries]] autorelease];
    NSLog([solver hasUniqueSolution] ? @"Random puzzle has a unique solution." : @"Random puzzle has more than one solution.");
    NonoGrid* solution = [solver solve];
    STAssertTrue([grid isEqualToGrid:solution], @"Solution does is not equal to random grid.");
}



@end
