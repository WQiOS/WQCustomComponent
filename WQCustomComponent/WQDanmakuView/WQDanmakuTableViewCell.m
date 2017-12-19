//
//  WQDanmakuTableViewCell.m
//  scrollTest
//
//  Created by 王强 on 2017/12/18.
//  Copyright © 2017年 stonemover. All rights reserved.
//

#import "WQDanmakuTableViewCell.h"

@implementation WQDanmakuTableViewCell

+ (WQDanmakuTableViewCell *)initCellWithIndexPath:(NSIndexPath *)indexPath andTableView:(UITableView *)tableView danakuString:(NSString *)danakuString danakuHight:(CGFloat)danakuHight danakuSpecHight:(CGFloat)danakuSpecHight danmakuFont:(UIFont *)danmakuFont
{
    WQDanmakuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WQDanmakuTableViewCell"];
    if (cell == nil) {
        cell = [[WQDanmakuTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WQDanmakuTableViewCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    CGSize titleLabelSize = [danakuString boundingRectWithSize:CGSizeMake(280, MAXFLOAT)options:(NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading)  attributes:@{ NSFontAttributeName : danmakuFont} context:nil].size;
    titleLabelSize.height = ceil(titleLabelSize.height) + 1;
    titleLabelSize.width = ceil(titleLabelSize.width);
    
    cell.danmakuLabel.text = danakuString;
    cell.danmakuLabel.font = danmakuFont;
    cell.danmakuLabel.textAlignment = NSTextAlignmentCenter;
    cell.danmakuLabel.frame = CGRectMake(15, danakuSpecHight, titleLabelSize.width + 15, danakuHight);
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setSubview];
    }
    return self;
}

- (void)setSubview
{
    self.danmakuLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 5, [[UIScreen mainScreen] bounds].size.width, self.contentView.bounds.size.height)];
    self.danmakuLabel.layer.masksToBounds = YES;
    self.danmakuLabel.layer.cornerRadius = 4;
    self.danmakuLabel.backgroundColor = [UIColor colorWithWhite:0 alpha:0.8];
    self.danmakuLabel.textColor =[UIColor whiteColor];
    self.danmakuLabel.textAlignment = NSTextAlignmentCenter;
    [self.contentView addSubview:self.danmakuLabel];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
