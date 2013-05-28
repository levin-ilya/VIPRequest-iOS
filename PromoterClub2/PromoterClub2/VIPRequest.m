//
//  VIPRequest.m
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/12/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import "VIPRequest.h"

@implementation VIPRequest

@synthesize name;
@synthesize guestNum;
@synthesize withTable;
@synthesize contactPrefs;
@synthesize promoContact;
@synthesize contactValue;

-(id)initwithName:(NSString *)Name AndGuestNum: (NSInteger)gustNum AndWithTable:(Boolean)table AndWithContactPrefs:(ContactPrefs)prefs AndWithContactValue:(NSString *)contactvalue AndWithPromoContact:(NSString *)promocontact{
    
    self.name=Name;
    self.guestNum=guestNum;
    self.withTable=table;
    self.contactPrefs=prefs;
    self.contactValue=contactvalue;
    self.promoContact=promocontact;
    return self;
}


-(void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:self.name forKey:@"name"];
   // [aCoder encodeInteger:*(self.guestNum) forKey:@"guestNum"];
   // [aCoder encodeBool:withTable forKey:@"withTable"];
    //[aCoder encodeObject:self.contactPrefs forKey:@"contactPrefs"];
    //[aCoder encodeObject:self.contactValue forKey:@"contactValue"];
   // [aCoder encodeObject:self.promoContact forKey:@"promoContact"];
    
    
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if(self){
        self.name = [aDecoder decodeObjectForKey:@"name"];
    }
    
    return self;
}


@end
