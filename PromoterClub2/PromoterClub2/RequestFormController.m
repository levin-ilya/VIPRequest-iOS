//
//  RequestFormController.m
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/11/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "RequestFormController.h"
#import "FormRow.h"
#import "VIPRequestService.h"

@interface RequestFormController ()

@end

@implementation RequestFormController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;

    
}

- (void)viewDidAppear:(BOOL)animated{
    NSArray *rows = [self.tableView visibleCells];
    for (FormRow *row in rows) {
        row.formController=self;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)sumbitRequest:(id)sender {
    VIPRequestService *service;
    NSInteger guestNum = [self.guestNum.text integerValue];
    Boolean withTable = [self.withTable selectedSegmentIndex]==0;
    ContactPrefs contactpref = [self.contactPrefs selectedSegmentIndex];
    NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"config" ofType:@"plist"];
    NSDictionary *appConfig = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    service = [[VIPRequestService alloc] initwithName:self.NameField.text
                                  AndGuestNum:guestNum
                                  AndWithTable:withTable
                                  AndWithContactPrefs:contactpref
                                  AndWithContactValue:self.Contact.text
                                  AndWithPromoContact:[appConfig objectForKey:@"promoContact"]];
    [service setDelegate:self];
    [service sendRequest];
    
        
}

- (void)hideKeyBoard{
    [self.NameField resignFirstResponder];
    [self.guestNum resignFirstResponder];
    [self.Contact resignFirstResponder];
}

-(void)requestFailed:(NSDictionary *)response{
    NSString *errorMsg = [response objectForKey:@"message"];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                    message:errorMsg
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    [alert show];
    
}

-(void)requestSucessful:(NSDictionary *)response{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                    message:@"Request has been sent!"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    
    [alert show];
}

-(void)noConnection{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Info"
                                                    message:@"Oh man. Can't connect."
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles: nil];
    
    [alert show];
    
}

-(void)sendingRequest{
    
}
@end
