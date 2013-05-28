//
//  VIPRequestService.m
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/12/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "VIPRequestService.h"
#import "VIPRequest.h"
@implementation VIPRequestService

@synthesize delegate;

NSString *baseURL = @"http://webbiebuilder.com/e75/final.php?method=vipRequest&name=%@&guest=%d&table=%@&contactPrefs=%@&contact=%@&promoContact=%@";

NSString * const contactMethodDisplay[] = {
    @"e-Mail",
    @"SMS"
};


-(void)sendRequest{
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    NSString *urlString = [NSString stringWithFormat:baseURL,self.name,self.guestNum,self.withTable?@"YES":@"NO",contactMethodDisplay[self.contactPrefs],self.contactValue,self.promoContact];
    
    NSURL *httpLink = [NSURL URLWithString:urlString];
    NSLog(@"%@",urlString);
    
    dispatch_async(queue, ^{
        NSData* data = [NSData dataWithContentsOfURL:
                        httpLink];
        [self performSelectorOnMainThread:@selector(fetchedData:)
                               withObject:data waitUntilDone:YES];
    });
    [self.delegate sendingRequest];
}

- (void)fetchedData:(NSData *)responseData {
    //parse out the json data
    NSError* error = [[NSError alloc] init];
    if(responseData){
        NSDictionary* results = [NSJSONSerialization
                              JSONObjectWithData:responseData
                              options:kNilOptions
                              error:&error];
        if([[results objectForKey:@"results"] isEqual:@"Success"]){
            [self.delegate requestSucessful:results];
        }else{
            [self.delegate requestFailed:results];
        }
    }else{
        [self.delegate noConnection];
    }
}

-(void)save{
    VIPRequest *obj1 = [[VIPRequest alloc] initwithName:@"test" AndGuestNum:5 AndWithTable:NO AndWithContactPrefs:email AndWithContactValue:@"ilya1113" AndWithPromoContact:@"ilevin"];
    VIPRequest *obj2 = [[VIPRequest alloc] initwithName:@"test" AndGuestNum:5 AndWithTable:NO AndWithContactPrefs:email AndWithContactValue:@"ilya1113" AndWithPromoContact:@"ilevin"];
    
    NSArray *test= [NSArray arrayWithObjects:obj1,obj2,nil];
   // [[NSUserDefaults standardUserDefaults] setObject:test forKey:@"MyRequests"];
   // NSArray *test3 = [[NSUserDefaults standardUserDefaults] objectForKey:@"MyRequests"];
    NSArray *document = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *path = [document objectAtIndex:0];
    path = [path stringByAppendingString:@"requests.data"];
    [NSKeyedArchiver archiveRootObject:test toFile:path];
    NSArray *test2 = (NSArray *)[NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

-(void)load{

    
}



@end
