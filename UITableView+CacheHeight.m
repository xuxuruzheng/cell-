//
//  UITableView+CacheHeight.m
//  cell自适应
//
//  Created by 徐征 on 2018/2/12.
//  Copyright © 2018年 徐征. All rights reserved.
//

#import "UITableView+CacheHeight.h"
#import <objc/runtime.h>

static const char *tableViewHeightAtIndexPathKey;
@implementation UITableView (CacheHeight)

- (void)setXx_heightAtIndexPath:(NSMutableDictionary *)xx_heightAtIndexPath {
    objc_setAssociatedObject(self, &tableViewHeightAtIndexPathKey, xx_heightAtIndexPath, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)xx_heightAtIndexPath
{
    return objc_getAssociatedObject(self, &tableViewHeightAtIndexPathKey);
}
@end
