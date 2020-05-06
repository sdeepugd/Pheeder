//
//  CornerSettings.h
//  Pheeder
//
//  Created by Deepak S on 28/04/20.
//  Copyright © 2020 Deepak S. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface CornerSettings : NSObject
@property (nonatomic) CGRect bounds;
@property (nonatomic) CGFloat fontStdHeight;
@property (nonatomic) CGFloat radius;
-(instancetype)initWithBounds:(CGRect)bounds;
-(CGFloat)scaledRadius;
@end
