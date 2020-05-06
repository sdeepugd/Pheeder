//
//  FeedListView.m
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "FeedListView.h"
#import "CornerSettings.h"

@implementation FeedListView

-(void)drawBoundary:(UIView*)view{
    CornerSettings *cornerSettings = [[CornerSettings alloc]initWithBounds:view.bounds];
    cornerSettings.radius = 4.0;
    UIBezierPath *roundedRect = [UIBezierPath bezierPathWithRoundedRect:view.bounds cornerRadius:[cornerSettings scaledRadius]];
    [[UIColor blackColor]setStroke];
    [roundedRect stroke];
    
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    
    
}


@end
