//
//  HomeViewController.h
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import <UIKit/UIKit.h>
#import "HeaderView.h"

NS_ASSUME_NONNULL_BEGIN

@interface HomeViewController : UIViewController<UICollectionViewDataSource,UICollectionViewDelegate>
@property (weak, nonatomic) IBOutlet HeaderView *navbar;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;


@end

NS_ASSUME_NONNULL_END
