//
//  XYCAEmitterButton.m
//  HZCityWork
//
//  Created by 王强 on 2018/1/27.
//  Copyright © 2018年 XinhuaMobile. All rights reserved.
//

#import "XYCAEmitterButton.h"

@interface XYCAEmitterButton()

@property (nonatomic, strong) CAEmitterLayer * explosionLayer;
@property (nonatomic, strong) CAEmitterCell * explosionCell;

@end

@implementation XYCAEmitterButton

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self.layer addSublayer:self.explosionLayer];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    // 发射源位置
    self.explosionLayer.position = CGPointMake(self.bounds.size.width/2, self.bounds.size.height/2);
}

/**
 * 外部添加粒子发散的动画
 */
- (void)addAnimation{
    // 通过关键帧动画实现缩放
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animation];
    animation.keyPath = @"transform.scale";
    animation.values = @[@1.2,@1.4, @0.6, @1.0];
    animation.duration = 0.5;
    animation.calculationMode = kCAAnimationCubic;
    [self.layer addAnimation:animation forKey:nil];
    // 让放大动画先执行完毕 再执行爆炸动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.25 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self startAnimation];
    });
}

/**
 * 开始动画
 */
- (void)startAnimation{
    // 用KVC设置颗粒个数
    int value = (arc4random() % 400) + 400;
    [self.explosionLayer setValue:[NSNumber numberWithInteger:value] forKeyPath:@"emitterCells.explosionCell.birthRate"];
    // 开始动画
    self.explosionLayer.beginTime = CACurrentMediaTime();
    // 延迟停止动画
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.15 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self stopAnimation];
    });
}

/**
 * 动画结束
 */
- (void)stopAnimation{
    // 用KVC设置颗粒个数
    [self.explosionLayer setValue:@0 forKeyPath:@"emitterCells.explosionCell.birthRate"];
    [self.explosionLayer removeAllAnimations];
}

// 1. 粒子
- (CAEmitterCell *)explosionCell{
    if (!_explosionCell) {
        _explosionCell = [CAEmitterCell emitterCell];
        _explosionCell.name = @"explosionCell";
        _explosionCell.alphaSpeed = -1.f; //粒子透明度在生命周期内的改变速度
        _explosionCell.alphaRange = 0.40; // 一个粒子的颜色透明度alpha能改变的范围
        _explosionCell.lifetime = 1.2; //cell在屏幕上显示多长时间
        _explosionCell.lifetimeRange = 0.2; //生命周期范围
        _explosionCell.velocity = 12.f; //速度
        _explosionCell.velocityRange = 10.f; //速度范围
        _explosionCell.scale = 0.08; //缩放比例
        _explosionCell.scaleRange = 0.02; //缩放比例范围
        _explosionCell.contents = (id)[[UIImage imageNamed:@"xy_newsdetail_sparkle"] CGImage];
    }
    return _explosionCell;
}

//2. 发射源
- (CAEmitterLayer *)explosionLayer{
    if (!_explosionLayer) {
        _explosionLayer = [CAEmitterLayer layer];
        _explosionLayer.emitterSize = CGSizeMake(self.bounds.size.width, self.bounds.size.height);
        _explosionLayer.emitterShape = kCAEmitterLayerCircle;
        _explosionLayer.emitterMode = kCAEmitterLayerOutline;
        _explosionLayer.renderMode = kCAEmitterLayerOldestFirst;
        _explosionLayer.emitterCells = @[self.explosionCell];
    }
    return _explosionLayer;
}

@end
