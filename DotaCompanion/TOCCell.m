//
//  TOCCell.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/18.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "TOCCell.h"

@implementation TOCCell
@synthesize identifier = _identifier;
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
