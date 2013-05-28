//
//  FormRow.h
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/11/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RequestFormController.h"

@interface FormRow : UITableViewCell

@property (readwrite,nonatomic) RequestFormController *formController;

@end
