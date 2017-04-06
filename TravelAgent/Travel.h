
#import <Foundation/Foundation.h>

@interface Travel : NSObject

@property (nonatomic,retain) NSString* travelId;
@property (nonatomic,retain) NSDate* departureTime;
@property (nonatomic,retain) NSDate* arrivalTime;
@property (nonatomic,retain) NSString* providerLogo;
@property (nonatomic,retain) NSString* price;
@property int numberOfStops;

- (id)initWithDict:(NSDictionary *)dict;
- (NSString *)departureTimeLabelText;
- (NSString *)priceLabelText;
- (NSString *)numberOfStopsLabelText;
- (NSURL *)providerLogoAsUrl;
- (NSString *)travelDurationLabelText;
@end
