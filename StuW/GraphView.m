//
//  GraphView.m
//  StuW
//
//  Created by Tony Love on 7/16/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

#import "GraphView.h"

@implementation GraphView

- (id)initWithFrame:(NSRect)frameRect
{
    if (![super initWithFrame:frameRect]) {
        return nil;
    }
    
    return self;
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
    NSAttributedString * yLabelLine1=[[NSAttributedString alloc] initWithString:@"Happiness" attributes: attributes];
    [yLabelLine1 drawAtPoint:NSMakePoint(5, bounds.size.height/2+36)];
    NSAttributedString * yLabelLine2=[[NSAttributedString alloc] initWithString:@"Stress" attributes: attributes];
    [yLabelLine2 drawAtPoint:NSMakePoint(5, bounds.size.height/2+24)];
    NSAttributedString * yLabelLine3=[[NSAttributedString alloc] initWithString:@"Stress Type" attributes: attributes];
    [yLabelLine3 drawAtPoint:NSMakePoint(5, bounds.size.height/2+12)];
    NSAttributedString * yLabelLine4=[[NSAttributedString alloc] initWithString:@"Workload" attributes: attributes];
    [yLabelLine4 drawAtPoint:NSMakePoint(5, bounds.size.height/2)];
    NSAttributedString * yLabelLine5=[[NSAttributedString alloc] initWithString:@"Sleep" attributes: attributes];
    [yLabelLine5 drawAtPoint:NSMakePoint(bounds.size.width-35, bounds.size.height/2)];
    NSAttributedString * yLabelLine6=[[NSAttributedString alloc] initWithString:@"(hrs)" attributes: attributes];
    [yLabelLine6 drawAtPoint:NSMakePoint(bounds.size.width-35, bounds.size.height/2-16)];
    
    // Label for the x axis.
    NSAttributedString * xLabel=[[NSAttributedString alloc] initWithString:@"Date" attributes: attributes];
    [xLabel drawAtPoint:NSMakePoint(bounds.size.width/2, 5)];
    
    // 0 to 10 markings for the left y axis.
    NSAttributedString * y10 =[[NSAttributedString alloc] initWithString:@"0" attributes: attributes];
    [y10 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 0*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y11 =[[NSAttributedString alloc] initWithString:@"1" attributes: attributes];
    [y11 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 1*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y12 =[[NSAttributedString alloc] initWithString:@"2" attributes: attributes];
    [y12 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 2*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y13 =[[NSAttributedString alloc] initWithString:@"3" attributes: attributes];
    [y13 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 3*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y14 =[[NSAttributedString alloc] initWithString:@"4" attributes: attributes];
    [y14 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 4*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y15 =[[NSAttributedString alloc] initWithString:@"5" attributes: attributes];
    [y15 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 5*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y16 =[[NSAttributedString alloc] initWithString:@"6" attributes: attributes];
    [y16 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 6*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y17 =[[NSAttributedString alloc] initWithString:@"7" attributes: attributes];
    [y17 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 7*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y18 =[[NSAttributedString alloc] initWithString:@"8" attributes: attributes];
    [y18 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 8*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y19 =[[NSAttributedString alloc] initWithString:@"9" attributes: attributes];
    [y19 drawAtPoint:NSMakePoint(leftyaxismarkoffset, xaxisheightoffset + 9*leftyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y110 =[[NSAttributedString alloc] initWithString:@"10" attributes: attributes];
    [y110 drawAtPoint:NSMakePoint(leftyaxismarkoffset-5, bounds.size.height-12)];
    
    // 0 to 15 markings for the right y axis.
    NSAttributedString * y20 =[[NSAttributedString alloc] initWithString:@"0" attributes: attributes];
    [y20 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 0*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y21 =[[NSAttributedString alloc] initWithString:@"1" attributes: attributes];
    [y21 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 1*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y22 =[[NSAttributedString alloc] initWithString:@"2" attributes: attributes];
    [y22 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 2*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y23 =[[NSAttributedString alloc] initWithString:@"3" attributes: attributes];
    [y23 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 3*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y24 =[[NSAttributedString alloc] initWithString:@"4" attributes: attributes];
    [y24 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 4*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y25 =[[NSAttributedString alloc] initWithString:@"5" attributes: attributes];
    [y25 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 5*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y26 =[[NSAttributedString alloc] initWithString:@"6" attributes: attributes];
    [y26 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 6*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y27 =[[NSAttributedString alloc] initWithString:@"7" attributes: attributes];
    [y27 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 7*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y28 =[[NSAttributedString alloc] initWithString:@"8" attributes: attributes];
    [y28 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 8*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y29 =[[NSAttributedString alloc] initWithString:@"9" attributes: attributes];
    [y29 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 9*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y210 =[[NSAttributedString alloc] initWithString:@"10" attributes: attributes];
    [y210 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 10*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y211 =[[NSAttributedString alloc] initWithString:@"11" attributes: attributes];
    [y211 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 11*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y212 =[[NSAttributedString alloc] initWithString:@"12" attributes: attributes];
    [y212 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 12*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y213 =[[NSAttributedString alloc] initWithString:@"13" attributes: attributes];
    [y213 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 13*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y214 =[[NSAttributedString alloc] initWithString:@"14" attributes: attributes];
    [y214 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, xaxisheightoffset + 14*rightyaxismarkspacing - xaxismarkoffset)];
    NSAttributedString * y215 =[[NSAttributedString alloc] initWithString:@"15" attributes: attributes];
    [y215 drawAtPoint:NSMakePoint(bounds.size.width - rightyaxismarkoffset, bounds.size.height-12)];

    
    // Month markings for the x axis.
    NSAttributedString * xAug =[[NSAttributedString alloc] initWithString:@"Aug" attributes:attributes];
    [xAug drawAtPoint:NSMakePoint(leftyaxisoffset + 0*xaxismarkspacing, dateoffset)];
    NSAttributedString * xSep =[[NSAttributedString alloc] initWithString:@"Sep" attributes:attributes];
    [xSep drawAtPoint:NSMakePoint(leftyaxisoffset + 31*xaxismarkspacing, dateoffset)];
    NSAttributedString * xOct =[[NSAttributedString alloc] initWithString:@"Oct" attributes:attributes];
    [xOct drawAtPoint:NSMakePoint(leftyaxisoffset + 61*xaxismarkspacing, dateoffset)];
    NSAttributedString * xNov =[[NSAttributedString alloc] initWithString:@"Nov" attributes:attributes];
    [xNov drawAtPoint:NSMakePoint(leftyaxisoffset + 92*xaxismarkspacing, dateoffset)];
    NSAttributedString * xDec =[[NSAttributedString alloc] initWithString:@"Dec" attributes:attributes];
    [xDec drawAtPoint:NSMakePoint(leftyaxisoffset + 122*xaxismarkspacing, dateoffset)];
    NSAttributedString * xJan =[[NSAttributedString alloc] initWithString:@"Jan" attributes:attributes];
    [xJan drawAtPoint:NSMakePoint(leftyaxisoffset + 153*xaxismarkspacing, dateoffset)];
    NSAttributedString * xFeb =[[NSAttributedString alloc] initWithString:@"Feb" attributes:attributes];
    [xFeb drawAtPoint:NSMakePoint(leftyaxisoffset + 184*xaxismarkspacing, dateoffset)];
    NSAttributedString * xMar =[[NSAttributedString alloc] initWithString:@"Mar" attributes:attributes];
    [xMar drawAtPoint:NSMakePoint(leftyaxisoffset + 213*xaxismarkspacing, dateoffset)];
    NSAttributedString * xApr =[[NSAttributedString alloc] initWithString:@"Apr" attributes:attributes];
    [xApr drawAtPoint:NSMakePoint(leftyaxisoffset + 244*xaxismarkspacing, dateoffset)];
    NSAttributedString * xMay =[[NSAttributedString alloc] initWithString:@"May" attributes:attributes];
    [xMay drawAtPoint:NSMakePoint(leftyaxisoffset + 274*xaxismarkspacing, dateoffset)];
    NSAttributedString * xJun =[[NSAttributedString alloc] initWithString:@"Jun" attributes:attributes];
    [xJun drawAtPoint:NSMakePoint(leftyaxisoffset + 305*xaxismarkspacing, dateoffset)];
    
}

- (NSBezierPath*)constructAxes
{
    NSRect bounds = [self bounds];
    NSBezierPath *axesPath = [NSBezierPath bezierPath];
    int leftyaxisoffset = 90;
    // int dashwidth = 10;
    int rightyaxisoffset = 70;
    int xaxisheightoffset = 40;
    float leftyaxisdashspacing = (bounds.size.height - xaxisheightoffset)/10;
    
    
    [[NSColor whiteColor] set];
    [NSBezierPath fillRect:bounds];
    [axesPath setLineWidth:1.0];
    
    // The points on the right of the dashes along the left and right y-axes.
//    NSPoint yAxis1_dash1right = {leftyaxisoffset + dashwidth,1*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash2right = {leftyaxisoffset + dashwidth,2*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash3right = {leftyaxisoffset + dashwidth,3*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash4right = {leftyaxisoffset + dashwidth,4*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash5right = {leftyaxisoffset + dashwidth,5*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash6right = {leftyaxisoffset + dashwidth,6*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash7right = {leftyaxisoffset + dashwidth,7*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash8right = {leftyaxisoffset + dashwidth,8*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash9right = {leftyaxisoffset + dashwidth,9*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash10right = {leftyaxisoffset + dashwidth,10*leftyaxisdashspacing + xaxisheightoffset};
    

    NSPoint rightYaxisTop = {bounds.size.width-rightyaxisoffset,bounds.size.height};
    
    
    // The points on the left of the dashes along the left and right y-axes.
//    NSPoint yAxis1_dash1left = {leftyaxisoffset,1*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash2left = {leftyaxisoffset,2*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash3left = {leftyaxisoffset,3*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash4left = {leftyaxisoffset,4*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash5left = {leftyaxisoffset,5*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash6left = {leftyaxisoffset,6*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash7left = {leftyaxisoffset,7*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash8left = {leftyaxisoffset,8*leftyaxisdashspacing + xaxisheightoffset};
//    NSPoint yAxis1_dash9left = {leftyaxisoffset,9*leftyaxisdashspacing + xaxisheightoffset};
    NSPoint yAxis1_dash10left = {leftyaxisoffset,10*leftyaxisdashspacing + xaxisheightoffset};
    
    NSPoint xAxisEndPoint = {bounds.size.width-rightyaxisoffset,xaxisheightoffset};
    NSPoint origin = {leftyaxisoffset,xaxisheightoffset};
    
    
    //[axesPath moveToPoint:yAxis1_dash10right];
    [axesPath moveToPoint:yAxis1_dash10left];
    //[axesPath lineToPoint:yAxis1_dash9left];
    //[axesPath lineToPoint:yAxis1_dash9right];
//    [axesPath lineToPoint:yAxis1_dash9left];
//    [axesPath lineToPoint:yAxis1_dash8left];
//    [axesPath lineToPoint:yAxis1_dash8right];
//    [axesPath lineToPoint:yAxis1_dash8left];
//    [axesPath lineToPoint:yAxis1_dash7left];
//    [axesPath lineToPoint:yAxis1_dash7right];
//    [axesPath lineToPoint:yAxis1_dash7left];
//    [axesPath lineToPoint:yAxis1_dash6left];
//    [axesPath lineToPoint:yAxis1_dash6right];
//    [axesPath lineToPoint:yAxis1_dash6left];
//    [axesPath lineToPoint:yAxis1_dash5left];
//    [axesPath lineToPoint:yAxis1_dash5right];
//    [axesPath lineToPoint:yAxis1_dash5left];
//    [axesPath lineToPoint:yAxis1_dash4left];
//    [axesPath lineToPoint:yAxis1_dash4right];
//    [axesPath lineToPoint:yAxis1_dash4left];
//    [axesPath lineToPoint:yAxis1_dash3left];
//    [axesPath lineToPoint:yAxis1_dash3right];
//    [axesPath lineToPoint:yAxis1_dash3left];
//    [axesPath lineToPoint:yAxis1_dash2left];
//    [axesPath lineToPoint:yAxis1_dash2right];
//    [axesPath lineToPoint:yAxis1_dash2left];
//    [axesPath lineToPoint:yAxis1_dash1left];
//    [axesPath lineToPoint:yAxis1_dash1right];
//    [axesPath lineToPoint:yAxis1_dash1left];
    
    [axesPath lineToPoint:origin];
    [axesPath lineToPoint:xAxisEndPoint];
    [axesPath lineToPoint:rightYaxisTop];
    
    
    [[NSColor blackColor] set];
    [axesPath stroke];
    
    return axesPath;
}

- (void)drawRect:(NSRect)dirtyRect {
    [self constructAxes];
    [self labelAxes];
}

@end
