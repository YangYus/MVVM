//
//  MessageViewModel.m
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import "MessageViewModel.h"

@implementation MessageViewModel
+ (instancetype)viewModelWithMessageLists:(NSMutableArray *)messageLists {
    MessageViewModel *viewModel = [MessageViewModel new];
    NSMutableArray *temp = [NSMutableArray array];
    for (messageListModel *model in messageLists) {
        MessageLisetLayout *layout = [MessageLisetLayout layoutWithMessageModel:model];
        [temp addObject:layout];
    }
    viewModel.layout = temp;
    return viewModel;
}
@end
