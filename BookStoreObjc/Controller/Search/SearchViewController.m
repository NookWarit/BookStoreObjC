#import "SearchViewController.h"
#import "HomeViewController.h"
#import "BookTableViewCell.h"
#import "DetailViewController.h"

@interface SearchViewController ()


@end

@implementation SearchViewController
@synthesize navBar;
@synthesize searchView;
@synthesize tableView;
@synthesize resultData;

NSMutableArray<APIObject *> *filterData;
BOOL filtered;


- (void)viewDidLoad {
    [super viewDidLoad];
    searchView.delegate = self;
    
    [navBar configureViewwithbackhide:NO withseachhide:YES navigation:self.navigationController];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"BookTableViewCell" bundle:nil ]forCellReuseIdentifier:@"BookTableViewCell"];
    
    [self getAPI];
    filtered = false;
    
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
                 weakSelf.tableView.reloadData;
             });
             
         }
      }
   }] resume];
}

- (void)pushToDetailwithIndexPath: (NSIndexPath *)indexpath {
    DetailViewController *detailVC = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    if (filtered) {
        detailVC.dataDisplay = filterData[indexpath.row];
    } else {
        detailVC.dataDisplay = resultData[indexpath.row];
    }
    [self.navigationController pushViewController:detailVC animated:TRUE];
}

// MARK: TableView

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    BookTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BookTableViewCell" forIndexPath:indexPath];
    APIObject *obj;
    if (filtered) {
        obj = filterData[indexPath.row];
    } else {
        obj = resultData[indexPath.row];
    }
    NSString *ttt = @"superJumbo";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"format LIKE %@",ttt];
    NSArray *filter = [obj.multi filteredArrayUsingPredicate:pre];
    
    NSString *data = @"";
    if (filter.count != 0) {
        MultimediaDataModel *urlData = [filter firstObject];
        data = urlData.imgUrl;
    }
    
    if (filtered) {
        [cell configureCellwithTitle:filterData[indexPath.row].title withdetail:filterData[indexPath.row].abstract withByline:filterData[indexPath.row].byline withImgUrl:data];

    } else {
        [cell configureCellwithTitle:resultData[indexPath.row].title withdetail:resultData[indexPath.row].abstract withByline:resultData[indexPath.row].byline withImgUrl:data];
        
    }
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (filtered){
        return  filterData.count;
    }
    return  resultData.count;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [self pushToDetailwithIndexPath:indexPath];
}

-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    filterData = [[NSMutableArray alloc]init];
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"SELF.title contains[c] %@",searchBar.text];
    NSMutableArray<APIObject *> *filter = (NSMutableArray<APIObject *>*)[resultData filteredArrayUsingPredicate:pre];
    filterData = filter;
   
    if (searchText.length == 0){
        filtered = false;
    }
    else {
        filtered = YES;
    }
    tableView.reloadData;
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    filtered = false;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    filtered = false;
}

@end
