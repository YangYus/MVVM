//
//  MessageFootView.m
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/12.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import "MessageFootView.h"
#import "UIColor+zhangshujia.h"
#define kScreenHeight ([UIScreen mainScreen].bounds.size.height)
#define kScreenWidth ([UIScreen mainScreen].bounds.size.width)
@interface MessageFootView()
@property(nonatomic, strong) UIButton *selectAllBtn;
@property(nonatomic, strong) UIButton *deleteBtn;
@property(nonatomic, strong) UIView *lineView;
@end
@implementation MessageFootView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self initWithBottomBtn];
    }
    return self;
}

- (void)initWithBottomBtn {
    //全选
    self.selectAllBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.selectAllBtn setTitle:@"全选" forState:UIControlStateNormal];
    [self.selectAllBtn setTitle:@"取消全选" forState:UIControlStateSelected];
    [self.selectAllBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    self.selectAllBtn.frame = CGRectMake(0, 0, kScreenWidth / 2 - 1, self.frame.size.height);
    [self.selectAllBtn addTarget:self action:@selector(selectBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.selectAllBtn];

    //中间竖线
    self.lineView = [UIView new];
    self.lineView.frame = CGRectMake(kScreenWidth / 2 - 1, 0, 1, self.frame.size.height);
    self.lineView.backgroundColor = [UIColor colorWithHexString:@"d1d1d1"];
    [self addSubview:self.lineView];
    
    //删除
    self.deleteBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.deleteBtn setTitle:@"删除" forState:UIControlStateNormal];
    [self.deleteBtn setTitleColor:[UIColor colorWithHexString:@"333333"] forState:UIControlStateNormal];
    self.deleteBtn.frame = CGRectMake(kScreenWidth / 2 - 1, 0, kScreenWidth / 2 + 1, self.frame.size.height);
    [self.deleteBtn addTarget:self action:@selector(deleteBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:self.deleteBtn];
}

- (void)selectBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(messageFootViewSelectBtn:)]) {
        [_delegate messageFootViewSelectBtn:sender];
    }
}

- (void)deleteBtn:(UIButton *)sender {
    if ([_delegate respondsToSelector:@selector(messageFootViewDeleteBtn:)]) {
        [_delegate messageFootViewDeleteBtn:sender];
    }
}
@end
