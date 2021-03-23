#import "DetailViewController.h"
#import "SDWebImage/SDWebImage.h"

@interface DetailViewController ()

@end

@implementation DetailViewController
@synthesize navBar;
@synthesize titleLabel;
@synthesize img;
@synthesize detailLabel;
@synthesize cardviewBtn;
@synthesize dataDisplay;

- (void)viewDidLoad {
    [super viewDidLoad];
    [navBar configureViewwithbackhide:NO withseachhide:YES navigation:self.navigationController];
    [titleLabel setText:dataDisplay.title];
    [titleLabel setFont:[UIFont fontWithName:@"Average-Regular" size:18]];
    [detailLabel setText:dataDisplay.abstract];
    [detailLabel setTextColor:UIColor.darkGrayColor];
    [detailLabel setFont:[UIFont fontWithName:@"Average-Regular" size:14]];
    [_wbBtn setTitle:@"Open WebSite" forState: normal];
    [_wbBtn.titleLabel setFont:[UIFont fontWithName:@"Average-Regular" size:16]];
    cardviewBtn.layer.cornerRadius = 8;
    cardviewBtn.layer.shadowColor = [UIColor blackColor].CGColor;
    cardviewBtn.layer.shadowRadius = 8;
    cardviewBtn.layer.shadowOpacity = 0.1;
    cardviewBtn.layer.shadowOffset = CGSizeMake(5, 3);
    
    APIObject *obj = dataDisplay;
    NSString *ttt = @"superJumbo";
    NSPredicate *pre = [NSPredicate predicateWithFormat:@"format LIKE %@",ttt];
    NSArray *filter = [obj.multi filteredArrayUsingPredicate:pre];
    
    NSString *data = @"";
    if (filter.count != 0) {
        MultimediaDataModel *urlData = [filter firstObject];
        data = urlData.imgUrl;
    }
    
    NSURL *URL =[NSURL URLWithString: data];
    [img sd_setImageWithURL:URL];
    
}

- (IBAction)webviewBtn:(id)sender {
    UIApplication *application = [UIApplication sharedApplication];
    NSURL *URL =[NSURL URLWithString: dataDisplay.url];
    [application openURL:URL options:@{} completionHandler:nil];
}
@end
