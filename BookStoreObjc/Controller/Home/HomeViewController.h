#import <UIKit/UIKit.h>
#import "HeaderView.h"
#import "APIObject.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet HeaderView *navbar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (retain, nonatomic) NSMutableArray<APIObject *> *resultData;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *activity;


@end

NS_ASSUME_NONNULL_END
