//
//  GraphView.h
//  StuW
//
//  Created by Tony Love on 7/16/16.
//  Copyright © 2016 Tony Love. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface GraphView : NSView
{
    NSBezierPath *path;
}

- (NSBezierPath *)constructAxes;

@end
