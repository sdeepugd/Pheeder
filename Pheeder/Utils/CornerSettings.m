//
//  CornerSettings.m
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import "CornerSettings.h"

@implementation CornerSettings

-(CGFloat)fontStdHeight{
    if(!_fontStdHeight){
        _fontStdHeight=180.0;
    }
    return _fontStdHeight;
}

-(CGFloat)radius{
    if(!_radius){
        _radius=5.0;
    }
    return _radius;
}

-(instancetype)initWithBounds:(CGRect)bounds{
    self = [super init];
    if(self){
        _bounds=bounds;
    }
    return self;
}

-(CGFloat)scaleFactor {
    return self.bounds.size.height / self.fontStdHeight;
}

-(CGFloat)scaledRadius {
    return self.radius * [self scaleFactor];
}

-(CGFloat)offset {
    return [self scaledRadius] / 3.0;
}

@end
