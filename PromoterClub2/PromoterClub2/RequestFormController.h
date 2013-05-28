//
//  RequestFormController.h
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/11/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VIPRequestService.h"
@interface RequestFormController : UITableViewController<RequestEvents>

@property (weak, nonatomic) IBOutlet UISegmentedControl *contactPrefs;
@property (weak, nonatomic) IBOutlet UITextField *guestNum;
@property (weak, nonatomic) IBOutlet UISegmentedControl *withTable;
@property (weak, nonatomic) IBOutlet UITextField *Contact;
- (IBAction)sumbitRequest:(id)sender;
- (void)hideKeyBoard;
@property (weak, nonatomic) IBOutlet UITextField *NameField;
@end
