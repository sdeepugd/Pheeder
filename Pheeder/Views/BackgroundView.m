//
//  BackgroundView.m
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "BackgroundView.h"
#import "CornerSettings.h"

@implementation BackgroundView



// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CornerSettings *cornerSettings = [[CornerSettings alloc]initWithBounds:self.bounds];
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:[cornerSettings scaledRadius]];
    [[UIColor colorNamed:@"Background"]setFill];
    [roundedRect fill];
    [[UIColor grayColor]setStroke];
    [roundedRect stroke];
    [roundedRect addClip];
}


@end
