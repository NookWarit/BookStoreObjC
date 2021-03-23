#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "APIObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface SearchViewController : UIViewController<UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet HeaderView *navBar;
@property (weak, nonatomic) IBOutlet UISearchBar *searchView;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (strong, nonatomic) NSMutableArray<APIObject *> *resultData;


@end

NS_ASSUME_NONNULL_END
