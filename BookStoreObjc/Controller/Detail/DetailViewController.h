#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "APIObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface DetailViewController : UIViewController
@property (weak, nonatomic) IBOutlet HeaderView *navBar;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UIButton *wbBtn;
- (IBAction)webviewBtn:(id)sender;
@property (weak, nonatomic) IBOutlet UIView *cardviewBtn;
@property (weak, nonatomic) APIObject *dataDisplay;

@end

NS_ASSUME_NONNULL_END
