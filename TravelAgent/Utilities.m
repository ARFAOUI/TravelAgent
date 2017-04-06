//
//  Utilities.m
//  TravelAgent
//
//  Created by Bechir on 05/04/2017.
//  Copyright © 2017 Bechir. All rights reserved.
//

#import "Utilities.h"

@implementation Utilities

+ (NSURL *)endpointUrlForTravelType:(TravelType)travelType{
    switch (travelType) {
        case TravelTypeTrain:
            return  [NSURL URLWithString:@"https://api.myjson.com/bins/3zmcy"];
            break;
        case TravelTypePlane:
            return [NSURL URLWithString:@"https://api.myjson.com/bins/w60i"];
            break;
        case TravelTypeBus:
            return [NSURL URLWithString:@"https://api.myjson.com/bins/37yzm"];
            break;
        default:
            break;
    }
}

+ (NSString *)travelTypeDiplayText:(TravelType)travelType{
    switch (travelType) {
        case TravelTypeTrain:
            return  @"Train";
            break;
        case TravelTypePlane:
            return @"Plane";
            break;
        case TravelTypeBus:
            return @"Bus";
            break;
        default:
            break;
    }
}
@end
