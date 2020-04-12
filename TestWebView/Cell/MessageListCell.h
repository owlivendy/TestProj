//
//  MessageListCell.h
//  TestWebView
//
//  Created by xiaofeishen on 2020/4/12.
//  Copyright © 2020 xiaofeishen. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface MessageListCell : UITableViewCell
@property (nonatomic, weak) IBOutlet UILabel *contentLb;
@property (nonatomic, weak) IBOutlet UILabel *timeLb;
@end

NS_ASSUME_NONNULL_END
