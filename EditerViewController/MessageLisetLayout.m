
//
//  MessageLisetLayout.m
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import "MessageLisetLayout.h"

@implementation MessageLisetLayout

+ (instancetype)layoutWithMessageModel:(messageListModel *)model {
    MessageLisetLayout *layout = [[MessageLisetLayout alloc] initWithModel:model];
    return layout;
}

- (instancetype)initWithModel:(messageListModel *)model {
    if (self = [super init]) {
        _listMode = model;
        [self layout];
    }
    return self;
}

//更改字体 判断逻辑 等等 在这方法里面写
- (void)layout {
    self.title = _listMode.title;
    self.time = _listMode.createTime;
    self.content = _listMode.content;
    self.isSelected = _listMode.isSelected;
}
@end
