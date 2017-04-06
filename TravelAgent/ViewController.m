#import "ViewController.h"
#import "APIRequester.h"
#import "Request.h"
#import "TravelAgent-Swift.h"
#import "MenuCollectionViewCell.h"
#import "Menu.h"
#import <pop/POP.h>

static NSString * const TravelCellIdentifier = @"TravelCellIdentifier";
static NSString * const programCollectionViewCellIdentifier = @"programCollectionViewCellIdentifier";

@interface ViewController ()
@property (nonatomic,retain) NSMutableArray * displayedItemsList;
@property (nonatomic,weak) IBOutlet UITableView * table;
@property (nonatomic,weak) IBOutlet UICollectionView * collectionView;
@property (nonatomic,retain) NSMutableArray* menuItemsList;
@property (nonatomic,weak) IBOutlet UIActivityIndicatorView* indicator;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self registerCells];
    [self configureRequest];
    [self configureMenu];
    [self configureNavigationBar];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - TableView Delegate


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    TravelCell* travelCell = [tableView dequeueReusableCellWithIdentifier:TravelCellIdentifier];
    [travelCell configureWithTravelWithTravel:[self.displayedItemsList objectAtIndex:indexPath.row]];
    return travelCell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.displayedItemsList.count;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 99;
}

#pragma mark - Configuration

- (void)registerCells{
     [self.table registerNib:[UINib nibWithNibName:@"TravelCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:TravelCellIdentifier];
}

- (void)configureMenu{
    
    self.menuItemsList = [NSMutableArray new];
    
    Request *request = [[Request alloc] init];
    [request configureBusType];
    Menu *item1 = [[Menu alloc] initWithDisplayName:@"Bus" Request:request];
    
    Request *request2 = [[Request alloc] init];
    [request2 configureTrainType];
    Menu *item2 = [[Menu alloc] initWithDisplayName:@"Train" Request:request2];
    
    Request *request3 = [[Request alloc] init];
    [request3 configurePlaneType];
    Menu *item3 = [[Menu alloc] initWithDisplayName:@"Plane" Request:request3];

    [self.menuItemsList addObject:item1];
    [self.menuItemsList addObject:item2];
    [self.menuItemsList addObject:item3];
    
    
    
}

- (void)configureNavigationBar{
    //could be localized in Localizable.string too
    self.navigationItem.title = @"Berlin - Paris";
    self.navigationItem.prompt = @"Today";
}

#pragma mark - API 

- (void)configureRequest{
    Request *request = [[Request alloc] init];
    [request configureBusType];
    self.displayedItemsList = [NSMutableArray new];
    [self startTravelDownloadWithRequest:request];
}

- (void)startTravelDownloadWithRequest:(Request *)request{
    if (request) {
        __weak __typeof__(self) weakSelf = self;
        [APIRequester downloadTravelListWithRequest:request
                                WithCompletionBlock:^(NSArray *array, NSError *error) {
                                    [weakSelf.displayedItemsList removeAllObjects];
                                    [weakSelf.displayedItemsList addObjectsFromArray:array];
                                    [weakSelf.table reloadData];
                                    [weakSelf animationTableViewOut];
                                }];
    }
}

#pragma mark - collectionView

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.menuItemsList.count;
}


- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    MenuCollectionViewCell* cell =  [collectionView dequeueReusableCellWithReuseIdentifier:programCollectionViewCellIdentifier
                                                                              forIndexPath:indexPath];
    [cell configureCellWithMenuItem:(Menu *)[self.menuItemsList objectAtIndex:indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    Menu *menuItem = [self.menuItemsList objectAtIndex:indexPath.row];
    [self startTravelDownloadWithRequest:menuItem.request];
    [self animateTableViewCollapse];
}

#pragma mark - animations

- (void)animateTableViewCollapse{
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    buttonAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 0, 0)];
    buttonAnimation.springBounciness = 10.0;
    buttonAnimation.springSpeed = 1.0;
    buttonAnimation.dynamicsMass = 1.0;
    [self.table pop_addAnimation:buttonAnimation forKey:@"pop"];
    [self scrollTableViewtoTheTop];
}

- (void)animationTableViewOut{
    POPSpringAnimation *buttonAnimation = [POPSpringAnimation animation];
    buttonAnimation.property = [POPAnimatableProperty propertyWithName:kPOPViewFrame];
    buttonAnimation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 47, self.view.bounds.size.width, self.view.bounds.size.height - 47)];
    buttonAnimation.springBounciness = 10.0;
    buttonAnimation.springSpeed = 1.0;
    buttonAnimation.dynamicsMass = 1.0;
    [self.table pop_addAnimation:buttonAnimation forKey:@"pop"];
    [self scrollTableViewtoTheTop];
}

- (void)scrollTableViewtoTheTop{
    [self.table setContentOffset:CGPointZero animated:YES];
}
@end
