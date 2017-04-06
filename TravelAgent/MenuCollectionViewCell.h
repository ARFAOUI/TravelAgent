
#import "Constants.h"
#import "Menu.h"
#import <UIKit/UIKit.h>

@interface MenuCollectionViewCell : UICollectionViewCell
@property (nonatomic,retain) IBOutlet UILabel* travelTypeDisplayLabel;

- (void)configureCellWithMenuItem:(Menu*)menu;

@end
