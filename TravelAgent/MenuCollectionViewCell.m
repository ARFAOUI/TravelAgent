#import "Utilities.h"
#import "MenuCollectionViewCell.h"


@implementation MenuCollectionViewCell

- (void)configureCellWithMenuItem:(Menu*)menu{
 
    self.travelTypeDisplayLabel.text = menu.displayName;
}


@end
