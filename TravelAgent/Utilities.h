
#import "Constants.h"
#import <Foundation/Foundation.h>

@interface Utilities : NSObject

+ (NSURL *)endpointUrlForTravelType:(TravelType)travelType;
+ (NSString *)travelTypeDiplayText:(TravelType)travelType;
@end
