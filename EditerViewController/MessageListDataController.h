//
//  messageListDataController.h
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "messageListModel.h"
typedef void(^ZTKCompletionCallback)();

@interface MessageListDataController : NSObject
@property (nonatomic, strong) NSMutableArray *listMessageArray;
@property (nonatomic, strong) NSMutableArray *deleteArray;
@property (nonatomic, assign) BOOL select;
- (void)requestMessageListWithCallBack:(ZTKCompletionCallback)callBack;
@end
