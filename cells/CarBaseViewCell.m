//
//  CarBaseViewCell.m
//  cells
//
//  Created by James Tang on 1/6/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarBaseViewCell.h"

@implementation CarBaseViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
