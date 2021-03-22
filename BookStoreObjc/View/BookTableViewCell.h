//
//  BookTableViewCell.h
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BookTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *cardView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *bylineLabel;
@property (weak, nonatomic) IBOutlet UIImageView *img;

@end

NS_ASSUME_NONNULL_END
