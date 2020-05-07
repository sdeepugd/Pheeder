//
//  ButtonView.m
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "ButtonView.h"
#import "CornerSettings.h"

@implementation ButtonView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CornerSettings *cornerSettings = [[CornerSettings alloc]initWithBounds:self.bounds];
    cornerSettings.radius = 40.0;
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[cornerSettings scaledRadius]];
    [[UIColor blueColor]setStroke];
    [roundedRect stroke];
    [[UIColor systemBlueColor]setFill];
    [roundedRect fill];
    [roundedRect addClip];
}


@end
