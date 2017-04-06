#import <Foundation/Foundation.h>
#import "Request.h"

@interface APIRequester : NSObject

+ (void)downloadTravelListWithRequest:(Request*)request WithCompletionBlock:(void(^)(NSArray *array, NSError *error))handler;

@end
