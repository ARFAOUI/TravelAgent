#import "Menu.h"

@implementation Menu

- (id)initWithDisplayName:(NSString *)name Request:(Request*)request{
    self = [super init];
    if(self) {
        self.displayName = name;
        self.request = request;
    }
    return self;
}
@end
