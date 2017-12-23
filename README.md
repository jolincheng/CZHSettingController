# CZHSettingController
ios 快速创建静态动态单元格的设置页面

![QQ20171223-122025-HD1.gif](http://upload-images.jianshu.io/upload_images/6709174-a2ec66907d91c58d.gif?imageMogr2/auto-orient/strip%7CimageView2/2/w/1240)


使用方法很简单，继承我的控制器，然后重写czh_setGroup方法，如果满足不了自己的需求，可以自己扩展item然后在frameModel和cell里面书写,如果设置动态在请求完成后在调用czh_setGroup,记得清空数组
```
- (void)czh_setGroup {
    [super czh_setGroup];
    
    CZHWeakSelf(self);
    
    CZHAvatartem *avatartem = [CZHAvatartem itemWithImageName:nil title:@"头像" canClick:YES];
    avatartem.avater = @"http://static.yygo.tv/avatar/185/59e45f2f0d640.png";
    
    CZHSettingFrameModel *avatarFrameModel = [[CZHSettingFrameModel alloc] init];
    avatarFrameModel.item = avatartem;
    
    
    CZHBadgeItem *friendItem = [CZHBadgeItem itemWithImageName:@"mine_friend" title:@"好友" canClick:YES];
    friendItem.badge = @"3";
    friendItem.descVc = [CZHViewController class];
    
    CZHSettingFrameModel *friendFrameModel = [[CZHSettingFrameModel alloc] init];
    friendFrameModel.item = friendItem;
    
    CZHFitImageItem *fitItem = [CZHFitImageItem itemWithImageName:@"mine_introduce" title:nil canClick:YES haveLine:YES];
    fitItem.descVc = [CZHViewController class];
    
    CZHSettingFrameModel *fitFrameModel = [[CZHSettingFrameModel alloc] init];
    fitFrameModel.item = fitItem;
    
   
    
    //昵称
    CZHEditArrowItem *nicknameItem = [CZHEditArrowItem itemWithImageName:nil title:@"昵称" canClick:YES] ;
    nicknameItem.detail = @"hahaha";
    nicknameItem.editCompleteBlock = ^(NSString *inputString) {//编辑完成回调
        CZHStrongSelf(self);
        
        NSLog(@"---%@", inputString);
        
    };
    CZHSettingFrameModel *nicknameModel = [[CZHSettingFrameModel alloc] init];
    nicknameModel.item = nicknameItem;
    
    
    ///版本号
    CZHBaseSettingItem *versionItem = [CZHBaseSettingItem itemWithImageName:nil title:@"版本号" canClick:NO haveLine:YES];
    versionItem.detail = [NSString stringWithFormat:@"V%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]];
    CZHSettingFrameModel *versionModel = [[CZHSettingFrameModel alloc] init];
    versionModel.item = versionItem;
    
    
    BOOL isOn = YES;
    CZHSwitchItem *soldItem = [CZHSwitchItem itemWithImageName:nil title:@"这是开关标题" canClick:YES haveLine:YES];
    soldItem.isOn = isOn;
    soldItem.detail = isOn ? @"打开" :  @"关闭";
    
    CZHSettingFrameModel *soldModel = [[CZHSettingFrameModel alloc] init];
    soldModel.item = soldItem;
    
    soldItem.switchBlock = ^(CZHSwitchItem *item, NSIndexPath *indexPath, BOOL isOn) {
        CZHStrongSelf(self);
        
   
        
        item.isOn = !isOn;
        item.detail = item.isOn ? @"打开" :  @"关闭";
        
        soldModel.item = item;
        
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    };
    
    
    //退出
    CZHExitItem *exitItem = [CZHExitItem itemWithImageName:nil title:@"退出登录" canClick:YES];
    exitItem.operationBlock = ^(CZHBaseSettingItem *item, NSIndexPath *indexPath) {
        NSLog(@"点击退出登录");
    };
    CZHSettingFrameModel *exitModel = [[CZHSettingFrameModel alloc] init];
    
    exitModel.item = exitItem;
    
    
    CZHSectionItem *sectionZero = [[CZHSectionItem alloc] init];
    sectionZero.headHeight = 20;
    sectionZero.items = @[avatarFrameModel];
    [self.sectionGroups addObject:sectionZero];
    
    CZHSectionItem *sectionOne = [[CZHSectionItem alloc] init];
    sectionOne.headHeight = 20;
    sectionOne.items = @[friendFrameModel, fitFrameModel];
    [self.sectionGroups addObject:sectionOne];
    
    CZHSectionItem *sectionTwo = [[CZHSectionItem alloc] init];
    sectionTwo.headHeight = 20;
    sectionTwo.items = @[nicknameModel, versionModel, soldModel];
    [self.sectionGroups addObject:sectionTwo];
    
    CZHSectionItem *sectionThree = [[CZHSectionItem alloc] init];
    sectionThree.headHeight = 50;
    sectionThree.items = @[exitModel];
    [self.sectionGroups addObject:sectionThree];
}
```

[简书地址](https://www.jianshu.com/p/d972b17d0f2c)
[博客地址](http://blog.csdn.net/HurryUpCheng/article/details/78879275)
