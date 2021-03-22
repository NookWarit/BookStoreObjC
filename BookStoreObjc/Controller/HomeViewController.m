#import "HomeViewController.h"
#import "APIObject.h"
#import "BookCollectionViewCell.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize navbar;
@synthesize collectionView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIViewController *home=[[UIViewController alloc]initWithNibName:@"HomeViewController" bundle:nil];
    UINavigationController *homeNavigationController = [[UINavigationController alloc] initWithRootViewController:home];
    [navbar configureView:true :false :homeNavigationController];
    
//    [[NSBundle mainBundle] loadNibNamed:@"BookCollectionViewCell" owner:self options:nil];
    [self.collectionView registerNib:[UINib nibWithNibName:@"BookCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"BookCollectionViewCell"];
//    [self getAPI];
    
}

- (void)getAPI{
    __weak typeof(self) weakSelf = self;
   NSString *address = [NSString stringWithFormat:@"http://api.nytimes.com/svc/topstories/v2/books.json?api-key=GDrQ2aBDKGj6DELALg9H4JeXLysN1peW"];
   // Send an ASYNCHRONOUS request

   NSURLRequest * urlRequest = [NSURLRequest requestWithURL:[NSURL URLWithString:address]];
   [[[NSURLSession sharedSession] dataTaskWithRequest:urlRequest completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
//       NSLog(@"%d",[NSThread isMainThread]);
      if (error) {
         NSLog(@"%@", error);
      } else {
         NSError * jsonError = nil;
         if (jsonError) {
            NSLog(@"%@", jsonError);
             
         } else {
             NSDictionary *dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&jsonError];
             NSLog(@"%@", dictionary);
             
             
             APIObject *api = [APIObject createApiObject:dictionary];
            
         }
      }
   }] resume];
}





- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BookCollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:@"BookCollectionViewCell" forIndexPath:indexPath];
    
//    cell.temp.text = @"";
        cell.backgroundColor=[UIColor clearColor];
        return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return  10;
}

@end
