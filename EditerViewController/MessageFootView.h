//
//  MessageFootView.h
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/12.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MessageFootViewDelegate <NSObject>

//全选
- (void)messageFootViewSelectBtn:(UIButton *)Btn;

//删除
- (void)messageFootViewDeleteBtn:(UIButton *)Btn;
@end

@interface MessageFootView : UIView
@property (nonatomic, assign) id<MessageFootViewDelegate>delegate;
@end
