#import "APIRequester.h"
#import "APIMapper.h"

@implementation APIRequester

+ (void)downloadTravelListWithRequest:(Request*)request WithCompletionBlock:(void(^)(NSArray *array, NSError *error))handler {
    
    NSURLSessionConfiguration* defaultConfigObject = [NSURLSessionConfiguration defaultSessionConfiguration];
    
    NSURLSession* defaultSession = [NSURLSession sessionWithConfiguration:defaultConfigObject
                                                                 delegate:nil
                                                            delegateQueue:[NSOperationQueue mainQueue]];
    
    NSMutableURLRequest * urlRequest = [NSMutableURLRequest requestWithURL:request.url];
    [urlRequest setHTTPMethod:request.method];
    NSURLSessionDataTask * dataTask =[defaultSession dataTaskWithRequest:urlRequest
                                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
                                                           if (error == nil) {
                                                               NSError* serializationError;
                                                               NSDictionary* content = [NSJSONSerialization JSONObjectWithData:data
                                                                                                                       options:kNilOptions
                                                                                                                         error:&serializationError];
                                                               if (!serializationError) {
                                                                   NSArray* mappedItems = [APIMapper mapTravelItemsFromDict:content];
                                                                   handler (mappedItems,nil);
                                                               }else{
                                                                   handler (nil,serializationError);
                                                               }
                                                           }else{
                                                               handler (nil,error);
                                                           }
                                                       }];
    [dataTask resume];

}


@end
