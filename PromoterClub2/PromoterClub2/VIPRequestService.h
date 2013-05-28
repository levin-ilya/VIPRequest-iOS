//
//  VIPRequestService.h
//  PromoterClub2
//
//  Created by ILYA LEVIN on 5/12/13.
//  Copyright (c) 2013 ILYA LEVIN. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "VIPRequest.h"

@protocol RequestEvents <NSObject>

-(void)sendingRequest;
-(void)noConnection;
-(void)requestSucessful:(NSDictionary*)response;
-(void)requestFailed:(NSDictionary*)response;

@end


@interface VIPRequestService : VIPRequest



-(void)sendRequest;
-(void)save;

@property(nonatomic,retain) id<RequestEvents> delegate;

@end
