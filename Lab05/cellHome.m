//
//  cellHome.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 27/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "cellHome.h"
#import <QuartzCore/QuartzCore.h>

@implementation cellHome

- (void)awakeFromNib {
    [super awakeFromNib];
    
    self.layer.masksToBounds = NO;
    self.layer.shadowOffset = CGSizeMake(-15, 20);
    self.layer.shadowRadius = 5;
    self.layer.shadowOpacity = 0.5;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
