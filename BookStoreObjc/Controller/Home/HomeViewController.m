#import "HomeViewController.h"
#import "APIObject.h"
#import "BookCollectionViewCell.h"
#import "SearchViewController.h"
#import "DetailViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize navbar;
@synthesize collectionView;
@synthesize resultData;
@synthesize activity;

- (void)pushToSearch {
    SearchViewController *searchVC = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    
    [self.navigationController pushViewController:searchVC animated:TRUE];
}

- (void)pushToDetailwithIndexPath: (NSIndexPath *)indexpath {
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    detailVC.dataDisplay = resultData[indexpath.row];
    [self.navigationController pushViewController:detailVC animated:TRUE];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *home=[[UIViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
    
    
    [navbar configureViewwithbackhide:YES withseachhide:NO navigation:homeNavigationController];
    
    [navbar.searchBtn addTarget:self action:@selector(pushToSearch) forControlEvents:UIControlEventTouchUpInside];
    
    [self.collectionView registerNib:[UINib nibWithNibName:@"BookCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BookCollectionViewCell"];
    [self.activity startAnimating];
    [self getAPI];
    
}

- (void)getAPI{
    __weak typeof(self) weakSelf = self;
   NSString *address = [NSString stringWithFormat:@"http://api.nytimes.com/svc/topstories/v2/books.json?api-key=GDrQ2aBDKGj6DELALg9H4JeXLysN1peW"];

   NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:address]];
   [[[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
      if (error) {
         NSLog(@"%@", error);
      } else {
         NSError * jsonError = nil;
         if (jsonError) {
            NSLog(@"%@", jsonError);
             
         } else {
             NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];

             weakSelf.resultData = [NSMutableArray new];
             NSArray *arr = [dictionary objectForKey:@"results"];

             for (NSDictionary *result in arr) {
                 APIObject *object = [APIObject createApiObject:result];
                 [weakSelf.resultData addObject:object];
             }
             dispatch_async(dispatch_get_main_queue(), ^{
                
                 weakSelf.collectionView.reloadData;
                 [self.activity stopAnimating];
             });
             
         }
      }
   }] resume];
    
}





- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BookCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"BookCollectionViewCell" forIndexPath:indexPath];
    APIObject *obj = resultData[indexPath.row];
    
    
    NSString *ttt = @"superJumbo";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"format LIKE %@",ttt];
    NSArray *filter = [obj.multi filteredArrayUsingPredicate:pre];
    
    NSString *data = @"";
    if (filter.count != 0) {
        MultimediaDataModel *urlData = [filter firstObject];
        data = urlData.imgUrl;
    }
    
    [cell configureCellwithTitle: obj.title withImgUrl: data];
    
        return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  resultData.count;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return (CGSize){(self.collectionView.bounds.size.width / 2 ) - 5,
                    self.collectionView.bounds.size.height /2.5};
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [self pushToDetailwithIndexPath:indexPath];
}

@end
