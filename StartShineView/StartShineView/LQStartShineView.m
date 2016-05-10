//
//  LQStartShineView.m
//  StartShine
//
//  Created by LiQuan on 16/5/10.
//  Copyright © 2016年 LiQuan. All rights reserved.
//


#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#import "LQStartShineView.h"

@implementation LQStartShineView

- (id)initWithFrame:(CGRect)frame movePath:(CGPathRef)path
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
        [self animationEmitter];
        
        if (!path) {
            path = [self defaultPath];
        }
        [self animationMoveWithPath:path];
    }
    return self;
}


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        [self animationEmitter];
        
        [self animationMoveWithPath:[self defaultPath]];
    }
    return self;
}

- (void)animationEmitter
{
    CAEmitterLayer *emitterLayer = (CAEmitterLayer *)self.layer;
    emitterLayer.emitterPosition = CGPointMake(SCREEN_WIDTH/2, SCREEN_HEIGHT/2);
    emitterLayer.emitterSize = self.bounds.size;
    emitterLayer.renderMode = kCAEmitterLayerAdditive;
    emitterLayer.emitterMode = kCAEmitterLayerPoints;
    emitterLayer.emitterShape = kCAEmitterLayerSphere;
    
 
    CAEmitterCell *cell1 = [self createEmitterCellWithContents:(id)[[UIImage imageNamed:@"dog"] CGImage]];
    cell1.scale = 0.3;
    cell1.scaleRange = 0.1;
    
    emitterLayer.emitterCells = @[cell1];
}

- (CAEmitterCell *)createEmitterCellWithContents:(id)contents
{
    CAEmitterCell *cell = [CAEmitterCell emitterCell];
    cell.birthRate = 120;
    cell.lifetime = 1;
    cell.lifetimeRange = 0.3;
    cell.contents = contents;
    cell.color = [[UIColor whiteColor] CGColor];
    cell.velocity = 50;
    cell.emissionLongitude = M_PI*2;
    cell.emissionRange = M_PI*2;
    cell.velocityRange = 10;
    cell.spin = 10;
    
    return cell;
}


- (void)animationMoveWithPath:(CGPathRef)path
{
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"emitterPosition"];
    animation.path = path;
    animation.duration = 4;
    animation.repeatCount = MAXFLOAT;
    [self.layer addAnimation:animation forKey:nil];
}

- (CGPathRef)defaultPath
{
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 50, SCREEN_HEIGHT - 50);
    CGPathAddCurveToPoint(path, NULL, SCREEN_WIDTH - 50.0, SCREEN_WIDTH - 100.0, SCREEN_WIDTH - 50.0, SCREEN_WIDTH - 120.0, SCREEN_WIDTH - 50.0, SCREEN_WIDTH - 275.0);
    
    return path;
}


+ (Class)layerClass
{
    return [CAEmitterLayer class];
}

@end
