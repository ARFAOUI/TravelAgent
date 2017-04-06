#import <Foundation/Foundation.h>
#import "Constants.h"

@interface Request : NSObject
@property (nonatomic,retain) NSURL* url;
@property (nonatomic,retain) NSString* method;
@property (nonatomic,retain) NSDictionary* result;

- (void)configurePlaneType;
- (void)configureTrainType;
- (void)configureBusType;

@end
