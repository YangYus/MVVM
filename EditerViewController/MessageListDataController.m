//
//  messageListDataController.m
//  ZhuanTiKu_GWY
//
//  Created by yangyu on 16/7/11.
//  Copyright © 2016年 youbinbin. All rights reserved.
//

#import "messageListDataController.h"
#import "YYModel.h"
#import "messageListModel.h"
@implementation MessageListDataController
- (void)requestMessageListWithCallBack:(ZTKCompletionCallback)callBack {
    NSArray *array = @[@{@"title":@"天天有活",@"content":@"让空间 健康减肥接口接口尽快发"},
                       @{@"title":@"fd ",@"content":@"让空间 健给个人认为接口接口尽快发"},
                       @{@"title":@"放大",@"content":@"UR畏惧我去任务我还要 "},
                       @{@"title":@"打发打发的发",@"content":@"语言让我去也有钱淫"},
                       @{@"title":@"儿童而打给他",@"content":@"uaqyqyu5ryhy如何让"},
                       @{@"title":@"二氧化氮",@"content":@"安检机构危机我就"},
                       @{@"title":@"同一人呀",@"content":@"工具类去几家更好看结合看"},
                       @{@"title":@"要热爱",@"content":@"刚进去昂个客人"},
                       @{@"title":@"要热爱",@"content":@"鬼地方加巧克力及顾客了"},
                       @{@"title":@"tray ",@"content":@"个大概看了看"},
                       @{@"title":@"鬼打鬼",@"content":@"发动机死；怕；破解尔特"},
                       @{@"title":@"噶啥的鬼地方",@"content":@"如家喝酒然后就会你不会"},
                       @{@"title":@"客户给机会",@"content":@"个好人法火炬区域去"},
                       @{@"title":@"回复的回复该多好",@"content":@"忽悠人奇虎有人呼吁人也"},
                       @{@"title":@"放个假",@"content":@"后台我据台湾和具体图"},
                       @{@"title":@"苏雅琪",@"content":@"看1⃣️我看我从热任务还引入人"},
                       @{@"title":@"远呀",@"content":@"强企业与UI奇偶怕怕"},
                       @{@"title":@"他说他强化与",@"content":@"破解考核表吗剪毛"},
                       @{@"title":@"u广东省高投入的是",@"content":@"句空话又惹人烦让他"},
                       @{@"title":@"奇特去玩一玩",@"content":@"气死我点击看空间你互惠互有"},
                       @{@"title":@"人员让他",@"content":@"据破的而设计哦你"},
                       @{@"title":@"QQ网购特易通",@"content":@"接口配得上我去我去换"},
                       @{@"title":@"华图热",@"content":@"hkiwti8jkeurtiutfde 然后越有人"},
                       @{@"title":@"月入",@"content":@"想查个人发挥发挥余热而已"},
                       @{@"title":@"有人忒热议",@"content":@"还替换金额和人人"},
                       @{@"title":@"同一人我以为",@"content":@"哈特徒儿u"},
                       @{@"title":@"还以为要求",@"content":@"搞飞机上观看人家说考虑过金额看来我家各类文件hi了因为"},
                       ];
    NSMutableArray *temp = [NSMutableArray array];
    for (NSDictionary *dict in array) {
        messageListModel *model = [messageListModel yy_modelWithDictionary:dict];
        model.isSelected = NO;
        [temp addObject:model];
    }
    self.listMessageArray = temp;
    callBack();
}

- (NSMutableArray *)deleteArray {
    if (!_deleteArray) {
        _deleteArray = [NSMutableArray array];
    }
    return _deleteArray;
}
@end
