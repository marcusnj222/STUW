//
//  GraphView.m
//  StuW
//
//  Created by Tony Love on 7/16/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

#import "GraphView.h"

@interface GraphView()
@property (nonatomic, strong) NSBezierPath *axesPath;
@property (nonatomic, strong) NSBezierPath *happinessPath;
@property (nonatomic, strong) NSBezierPath *stressAmountPath;
@property (nonatomic, strong) NSBezierPath *stressTypePath;
@property (nonatomic, strong) NSBezierPath *sleepPath;
@property (nonatomic, strong) NSBezierPath *workloadPath;
@end

@implementation GraphView

- (id)initWithFrame:(NSRect)frameRect
{
    if (![super initWithFrame:frameRect]) {
        return nil;
    }
    
    return self;
}

- (void)drawRect:(NSRect)dirtyRect {
    [self drawAxes];
    [self labelAxes];
}

- (void)labelAxes
{
    NSRect bounds = [self bounds];
    NSDictionary *attributes = [NSDictionary dictionaryWithObjectsAndKeys:[NSFont fontWithName:@"Helvetica" size:12], NSFontAttributeName,[NSColor blackColor], NSForegroundColorAttributeName, nil];
    int leftyaxismarkoffset = 80;
    int leftyaxisoffset = 90;
    int rightyaxisoffset = 70;
    int xaxisheightoffset = 40;
    int xaxismarkoffset = 6;
    int dateoffset = 25;
    int rightyaxismarkoffset = 65;
    float xaxismarkspacing = (bounds.size.width - leftyaxisoffset-rightyaxisoffset)/320;
    float leftyaxismarkspacing = (bounds.size.height - xaxisheightoffset)/10;
    float rightyaxismarkspacing = (bounds.size.height - xaxisheightoffset)/15;


    
    // Labels for the left and right y axes.
    NSArray *yAxisLabels = @[@"Happiness",@"Stress", @"Stress Type", @"Workload", @"Sleep", @"(hrs)",@"",@""];
    for (int i = 0; i < 4; i++) {
        NSAttributedString *leftTempLabel = [[NSAttributedString alloc] initWithString:yAxisLabels[i] attributes:attributes];
        NSAttributedString *rightTempLabel = [[NSAttributedString alloc] initWithString:yAxisLabels[i+4] attributes:attributes];
        [leftTempLabel drawAtPoint:NSMakePoint(5, bounds.size.height/2 + 12*i)];
        [rightTempLabel drawAtPoint:NSMakePoint(bounds.size.width-35, bounds.size.height/2 - 12*i)];
    }
    
    // Label for the x axis.
    NSAttributedString * xLabel=[[NSAttributedString alloc] initWithString:@"Date" attributes: attributes];
    [xLabel drawAtPoint:NSMakePoint(bounds.size.width/2, 5)];
    
    
    // 0 to 10, 0 to 15, and month markings for the axes.
    NSArray *monthAbbreviations = @[@"Aug",@"Sep",@"Oct", @"Nov", @"Dec", @"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun"];
    NSArray *monthPlacements = @[@0, @31, @61, @92, @122, @153, @184, @213, @244, @274, @304];
    for (int i = 0; i < 16; i++) {
        if (i < 11) { // Handles the months and 0 to 10 markings on the leftside and rightside y axes.
            NSAttributedString *tempLeftMarking =[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", i] attributes: attributes];
            [tempLeftMarking drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + i*leftyaxismarkspacing - xaxismarkoffset)];
            NSAttributedString *tempMonth = [[NSAttributedString alloc] initWithString:monthAbbreviations[i] attributes:attributes];
            [tempMonth drawAtPoint:NSMakePoint(leftyaxisoffset + [monthPlacements[i] intValue]*xaxismarkspacing, dateoffset)];
            NSAttributedString *tempRightMarking =[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", i] attributes: attributes];
            [tempRightMarking drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + i*rightyaxismarkspacing - xaxismarkoffset)];
        } else { // Handles the remaining 11 to 15 markings on the rightside y axis.
            NSAttributedString *tempRightMarking =[[NSAttributedString alloc] initWithString:[NSString stringWithFormat:@"%d", i] attributes: attributes];
            [tempRightMarking drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + i*rightyaxismarkspacing - xaxismarkoffset)];
        }
    }
}

- (void)drawAxes
{
    NSRect bounds = [self bounds];
    self.axesPath = [NSBezierPath bezierPath];
    int leftyaxisoffset = 90;
    int rightyaxisoffset = 70;
    int xaxisheightoffset = 40;
    
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:bounds];
    [self.axesPath setLineWidth:1.0];

    NSPoint rightYaxisTop = {bounds.size.width-rightyaxisoffset,bounds.size.height};
    NSPoint leftYAxisTop = {leftyaxisoffset,bounds.size.height};
    NSPoint xAxisEndPoint = {bounds.size.width-rightyaxisoffset,xaxisheightoffset};
    NSPoint origin = {leftyaxisoffset,xaxisheightoffset};
    
    [self.axesPath moveToPoint:leftYAxisTop];
    [self.axesPath lineToPoint:origin];
    [self.axesPath lineToPoint:xAxisEndPoint];
    [self.axesPath lineToPoint:rightYaxisTop];
    
    [[NSColor blackColor] set];
    [self.axesPath stroke];
}



- (void)setHappinessPath:(NSArray *)happinessPoints{
    // Draw this graph in green. NSColor greenColor
    NSLog(@"Array sent to drawHappinessGraph: %@", happinessPoints);
    //unsigned long numberOfHappinessPoints = [happinessPoints count];
    //CGPoint point = [happinessPoints[0] CGPointValue];
    self.happinessPath = [NSBezierPath bezierPath];
    [self.happinessPath moveToPoint:NSMakePoint(50, 70)];
    [self.happinessPath lineToPoint:NSMakePoint(100,10)];
    [self.happinessPath setLineWidth:5.0];
    [self.happinessPath stroke];
    //for (int i = 1; i < numberOfHappinessPoints; i++) {
    //    CGPoint temppoint = [happinessPoints[i] CGPointValue];
    //    [self.happinessGraph lineToPoint:NSMakePoint(temppoint.x, temppoint.y)];
    //}
    // [self setNeedsDisplay:YES];
    
}
- (void)drawStressLevelGraph:(NSArray*)stressPoints{
    // Draw this graph in purple. NSColor yellowColor
}
- (void)drawStressTypeGraph: (NSArray*)stressTypePoints{
    // Draw this graph in red. NSColor redColor
}
- (void)drawWorkloadGraph:(NSArray*)workloadPoints{
    // Draw this graph in gray. NSColor grayColor
}
- (void)drawSleepGraph:(NSArray*)sleepPoints{
    // Draw this graph in cyan. NSColor cyanColor
}
- (void)drawLine{
    NSBezierPath *bPath = [NSBezierPath bezierPath];
    [bPath moveToPoint:NSMakePoint(50, 50)];
    [bPath lineToPoint:NSMakePoint(500, 50)];
    [bPath setLineWidth:5.0];
    [bPath stroke];
    [self setNeedsDisplay:YES];
}

@end
