//
//  FormRow.m
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/11/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "FormRow.h"

@implementation FormRow

@synthesize formController;

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

-(BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch{
    [self.formController hideKeyBoard];
    return true;
}

@end
