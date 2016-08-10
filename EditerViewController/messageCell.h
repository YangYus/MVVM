//
//  messageCell.h
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MessageLisetLayout.h"
@interface messageCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;
@property (weak, nonatomic) IBOutlet UIButton *messageBtn;

@property (nonatomic, strong) MessageLisetLayout *layout;
@end
