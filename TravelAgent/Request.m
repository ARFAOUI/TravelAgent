#import "Request.h"
#import "Utilities.h"

@implementation Request

- (void)configureRequestwithType:(TravelType)travelType{
    self.url = [Utilities endpointUrlForTravelType:travelType];
    self.method = GET;
}

- (void)configurePlaneType{
    [self configureRequestwithType:TravelTypePlane];
}

- (void)configureTrainType{
    [self configureRequestwithType:TravelTypeTrain];
}

- (void)configureBusType{
    [self configureRequestwithType:TravelTypeBus];
}

@end
