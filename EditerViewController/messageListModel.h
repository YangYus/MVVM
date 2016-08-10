//
//  messageListModel.h
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface messageListModel : NSObject
@property (nonatomic, assign) BOOL isSelected;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createTime;
@end
