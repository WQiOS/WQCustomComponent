//
//  WQDanmakuTableViewCell.h
//  scrollTest
//
//  Created by 王强 on 2017/12/18.
//  Copyright © 2017年 stonemover. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WQDanmakuTableViewCell : UITableViewCell


/**
 弹幕
 */
@property(nonatomic,strong)UILabel *danmakuLabel;

/**
 弹幕实体cell

 @param indexPath       位置indexPath
 @param tableView       父视图
 @param danakuString    弹幕内容
 @param danakuHight     弹幕高度
 @param danakuSpecHight 弹幕间隙
 @param danmakuFont     弹幕字体大小
 @return 弹幕实体
 */
+ (WQDanmakuTableViewCell *)initCellWithIndexPath:(NSIndexPath *)indexPath andTableView:(UITableView *)tableView danakuString:(NSString *)danakuString danakuHight:(CGFloat)danakuHight danakuSpecHight:(CGFloat)danakuSpecHight danmakuFont:(UIFont *)danmakuFont;
@end
