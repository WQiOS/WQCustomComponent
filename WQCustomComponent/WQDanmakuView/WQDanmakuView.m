//
//  WQDanmakuView.m
//  scrollTest
//
//  Created by 王强 on 2017/12/18.
//  Copyright © 2017年 stonemover. All rights reserved.
//

#import "WQDanmakuView.h"
#import "UIScrollView+ScrollAnimation.h"
#import "WQDanmakuTableViewCell.h"

@interface WQDanmakuView ()<UITableViewDelegate,UITableViewDataSource>

@end

@implementation WQDanmakuView

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.danmakuHight = 30;
        self.danmakuSpecHight = 5;
        self.currentSplider = 1;
        self.danmakuFont = [UIFont systemFontOfSize:14.0];
        [self addSubview:self.tablewView];
    }
    return self;
}

-(void)setDanmakuArray:(NSArray *)danmakuArray
{
    _danmakuArray = [NSArray arrayWithArray:danmakuArray];
    CAMediaTimingFunction * timing=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.tablewView setContentOffset:CGPointMake(0, self.tablewView.contentOffset.y+self.danmakuHight + self.danmakuSpecHight) withTimingFunction:timing duration:self.currentSplider];
//    [self.tablewView reloadData];
}

#pragma mark - UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return self.danmakuHight + self.danmakuSpecHight;
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.danmakuArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *danmakuString = self.danmakuArray[indexPath.row];
    WQDanmakuTableViewCell *cell = [WQDanmakuTableViewCell initCellWithIndexPath:indexPath andTableView:tableView danakuString:danmakuString danakuHight:self.danmakuHight danakuSpecHight:self.danmakuSpecHight danmakuFont:self.danmakuFont];
    return cell;
}

-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    NSLog(@"弹幕：%@",@"scrollViewDidEndScrollingAnimation");
    CAMediaTimingFunction * timing=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    if (self.tablewView.contentOffset.y< self.danmakuArray.count * (self.danmakuHight + self.danmakuSpecHight)) {
        [self.tablewView setContentOffset:CGPointMake(0, self.tablewView.contentOffset.y+self.danmakuHight + self.danmakuSpecHight) withTimingFunction:timing duration:_currentSplider];
    }
}

-(UITableView *)tablewView
{
    if (!_tablewView) {
        _tablewView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0,self.bounds.size.width , self.bounds.size.height) style:UITableViewStylePlain];
        _tablewView.delegate = self;
        _tablewView.dataSource = self;
        _tablewView.contentInset = UIEdgeInsetsMake(0, 0, 5, 0);
        _tablewView.showsVerticalScrollIndicator = NO;
        [_tablewView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tablewView.tableFooterView = [UIView new];
    }
    return _tablewView;
}



@end
