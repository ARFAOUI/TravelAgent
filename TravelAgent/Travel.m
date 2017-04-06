
#import "Travel.h"

@implementation Travel

- (id)initWithDict:(NSDictionary *)dict{
    
    self = [super init];
    if(self) {
        [self configureTravelWithDictionary:dict];
    }
    return self;
}

- (void)configureTravelWithDictionary:(NSDictionary*)dict{
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    
    self.travelId = [dict objectForKey:@"id"];
    
    self.departureTime = [dateFormatter dateFromString:[dict objectForKey:@"departure_time"]];
    self.arrivalTime = [dateFormatter dateFromString:[dict objectForKey:@"arrival_time"]];
    
    self.providerLogo = [dict objectForKey:@"provider_logo"];
    self.price = [dict objectForKey:@"price_in_euros"];
    self.numberOfStops = [[dict objectForKey:@"number_of_stops"] intValue];
    
}

- (NSString *)departureTimeLabelText{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"HH:mm"];
    return [NSString stringWithFormat:@"%@ - %@",[dateFormatter stringFromDate:self.departureTime],[dateFormatter stringFromDate:self.arrivalTime]];
}

- (NSString *)priceLabelText{
    return [NSString stringWithFormat:@"€ %.02f",self.price.floatValue];
}

- (NSString *)numberOfStopsLabelText{
    return self.numberOfStops == 0 ? @"Direct" : [NSString stringWithFormat:@"%i",self.numberOfStops];
}
- (NSURL *)providerLogoAsUrl{
    
    NSString* imageLinkWithSize = [self.providerLogo stringByReplacingOccurrencesOfString:@"{size}" withString:@"63"];
    return [NSURL URLWithString:imageLinkWithSize];
}

- (NSString *)travelDurationLabelText{
    NSDateFormatter *df = [[NSDateFormatter alloc] init];
    [df setDateFormat:@"HH:mm"];
    NSDate *date1 = self.departureTime;
    NSDate *date2 = self.arrivalTime;
    NSTimeInterval interval = [date2 timeIntervalSinceDate:date1];
    int hours = (int)interval / 3600;             // integer division to get the hours part
    int minutes = (interval - (hours*3600)) / 60; // interval minus hours part (in seconds) divided by 60 yields minutes
    NSString *timeDiff = [NSString stringWithFormat:@"%d:%02dh", hours, minutes];
    return timeDiff;
}
@end
