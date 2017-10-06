//
//  SimpleCell_Date.m
//  EventApp
//
//  Created by forever on 9/26/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "SimpleCell_Date.h"

@implementation SimpleCell_Date

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    [self.label_location setFont:[UIFont systemFontOfSize:10]];
    [self.label_time setFont:[UIFont systemFontOfSize:10]];
    // Configure the view for the selected state
}

@end
