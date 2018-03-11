//
//  UIViewController+CacheHeight.m
//  cell自适应
//
//  Created by 徐征 on 2018/2/12.
//  Copyright © 2018年 徐征. All rights reserved.
//

#import "UIViewController+CacheHeight.h"
#import <objc/runtime.h>
#import "UITableView+CacheHeight.h"

@implementation UIViewController (CacheHeight)
#pragma mark ---- 缓存高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return UITableViewAutomaticDimension;
}
- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *number = [tableView.xx_heightAtIndexPath objectForKey:indexPath];
    if (number)
    {
        return number.floatValue;
    }
    else
    {
        return 100;
    }
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSNumber *number = @(cell.frame.size.height);
    [tableView.xx_heightAtIndexPath setObject:number forKey:indexPath];
}
@end
