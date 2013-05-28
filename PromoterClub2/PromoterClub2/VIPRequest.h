//
//  VIPRequest.h
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/12/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {email=0,sms} ContactPrefs;

@interface VIPRequest : NSObject<NSCoding>

@property NSString *name;
@property NSInteger *guestNum;
@property Boolean withTable;
@property ContactPrefs contactPrefs;
@property NSString *contactValue;
@property NSString *promoContact;

-(id)initwithName:(NSString *)Name AndGuestNum: (NSInteger)gustNum AndWithTable:(Boolean)table AndWithContactPrefs:(ContactPrefs)prefs AndWithContactValue:(NSString *)contactvalue AndWithPromoContact:(NSString *)promocontact;


@end
