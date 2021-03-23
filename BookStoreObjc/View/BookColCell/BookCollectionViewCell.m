#import "BookCollectionViewCell.h"
#import "SDWebImage/SDWebImage.h"

@implementation BookCollectionViewCell
@synthesize cardView;
@synthesize bgView;
@synthesize img;
@synthesize titleLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    [titleLabel setFont: [UIFont fontWithName:@"Average-Regular" size:10]];
    cardView.layer.cornerRadius = 8;
    cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    cardView.layer.shadowRadius = 8;
    cardView.layer.shadowOpacity = 0.1;
    cardView.layer.shadowOffset = CGSizeMake(5, 3);
    bgView.layer.masksToBounds = true;
    bgView.layer.cornerRadius = 8;
    bgView.layer.maskedCorners =  kCALayerMinXMaxYCorner | kCALayerMaxXMaxYCorner;
}

-(void)configureCellwithTitle:(NSString*)title withImgUrl:(NSString*)imgUrl{
    [titleLabel setText: title];
    
    NSURL *URL =[NSURL URLWithString: imgUrl];
    [img sd_setImageWithURL:URL];
}

@end
