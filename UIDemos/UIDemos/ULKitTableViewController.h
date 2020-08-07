//
//  ULKitTableViewController.h
//  KilaKit
//
//  Created by fanchuan on 2020/5/12.
//  Copyright © 2020 LeeWong. All rights reserved.
//

#import "ULKitBaseViewController.h"
#import "ULRootListModel.h"

@interface ULKitTableViewController : ULKitBaseViewController<UITableViewDelegate,UITableViewDataSource>

- (NSArray *)listData;

@end

