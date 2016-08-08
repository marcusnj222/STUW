//
//  GraphView.h
//  StuW
//
//  Created by Tony Love on 7/16/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GraphView : NSView

- (void)drawAxes;
- (void)labelAxes;
- (id)initWithFrame:(NSRect)frameRect;
- (void)drawRect:(NSRect)dirtyRect;
- (void)drawLine;
- (void)setHappinessPath:(NSArray*)happinessPoints;
- (void)setStressLevelPath:(NSArray*)stressPoints;
- (void)setStressTypePath: (NSArray*)stressTypePoints;
- (void)setWorkloadPatj:(NSArray*)workloadPoints;
- (void)setSleepPath:(NSArray*)sleepPoints;


@end
