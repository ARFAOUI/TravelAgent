
#import <Foundation/Foundation.h>
#import "Request.h"

@interface Menu : NSObject
@property (nonatomic,retain) NSString * displayName;
@property (nonatomic,retain) Request * request;

- (id)initWithDisplayName:(NSString *)name Request:(Request*)request;
@end
