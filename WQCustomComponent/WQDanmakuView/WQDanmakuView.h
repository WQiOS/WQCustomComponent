//
//  WQDanmakuView.h
//  scrollTest
//
//  Created by 王强 on 2017/12/18.
//  Copyright © 2017年 stonemover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQDanmakuView : UIView

/**
 弹幕源
 */
@property(nonatomic,strong)NSArray *danmakuArray;

/**
 弹幕实体
 */
@property(nonatomic,strong)UITableView *tablewView;

/**
 弹幕的高度(默认高度为30)
 */
@property(nonatomic,assign)CGFloat danmakuHight;

/**
 弹幕的间隙(默认高度为5)
 */
@property(nonatomic,assign)CGFloat danmakuSpecHight;

/**
 弹幕的时间间隔(默认高度为1s/个，范围在0.5-3之间)
 */
@property(nonatomic,assign)float currentSplider;

/**
 弹幕的字体(默认高度为14)
 */
@property(nonatomic,assign)UIFont *danmakuFont;

@end
