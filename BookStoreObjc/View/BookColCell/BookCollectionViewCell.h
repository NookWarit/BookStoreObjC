//
//  BookCollectionViewCell.h
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *img;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UIView *bgView;
@property (weak, nonatomic) IBOutlet UIView *cardView;

-(void)configureCellwithTitle:(NSString*)title withImgUrl:(NSString*)imgUrl;

@end

NS_ASSUME_NONNULL_END
