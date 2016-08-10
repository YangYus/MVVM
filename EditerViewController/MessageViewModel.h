//
//  MessageViewModel.h
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "messageListModel.h"
#import "MessageLisetLayout.h"
@interface MessageViewModel : NSObject
@property (nonatomic, strong) NSMutableArray *layout;
+ (instancetype)viewModelWithMessageLists:(NSMutableArray *)messageLists;
@end
