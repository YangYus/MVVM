//
//  messageCell.m
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import "messageCell.h"

@implementation messageCell

- (void)awakeFromNib {
    self.messageBtn.hidden = YES;
    self.messageBtn.userInteractionEnabled = NO;
}

- (void)setLayout:(MessageLisetLayout *)layout {
    if (layout) {
        _layout = layout;
        self.timeLabel.text = layout.time;
        self.contentLabel.text = layout.content;
        self.titleLabel.text = layout.title;
        self.messageBtn.selected = layout.isSelected;
    }
}

@end
