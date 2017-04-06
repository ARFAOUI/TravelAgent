
#import "APIMapper.h"
#import "Travel.h"

@implementation APIMapper

+ (NSArray*)mapTravelItemsFromDict:(NSDictionary*)dict{
   
    NSMutableArray* mappedContent = [NSMutableArray new];
    for (int i = 0; i < [(NSArray*)dict count]; i++) {

        Travel* travel = [[Travel alloc] initWithDict:[(NSArray*)dict objectAtIndex:i]];
        [mappedContent addObject:travel];
    }
    return mappedContent;
    
}
@end
