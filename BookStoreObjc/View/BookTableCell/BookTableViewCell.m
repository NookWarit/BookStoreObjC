#import "BookTableViewCell.h"
#import "SDWebImage/SDWebImage.h"

@implementation BookTableViewCell
@synthesize titleLabel;
@synthesize cardView;
@synthesize detailLabel;
@synthesize bylineLabel;
@synthesize img;

- (void)awakeFromNib {
    [super awakeFromNib];
    [titleLabel setFont: [UIFont fontWithName:@"Average-Regular" size:12]];
    [detailLabel setFont: [UIFont fontWithName:@"Average-Regular" size:10]];
    [detailLabel setTextColor:UIColor.systemGrayColor];
    [bylineLabel setFont: [UIFont fontWithName:@"Average-Regular" size:10]];
    [bylineLabel setTextColor:UIColor.systemGrayColor];
    cardView.layer.cornerRadius = 8;
    cardView.layer.shadowColor = [UIColor blackColor].CGColor;
    cardView.layer.shadowRadius = 8;
    cardView.layer.shadowOpacity = 0.1;
    cardView.layer.shadowOffset = CGSizeMake(5, 3);
}

-(void) configureCellwithTitle:(NSString *)title withdetail:(NSString *)detail withByline:(NSString *)byline withImgUrl:(NSString *)imgUrl {
    [titleLabel setText: title];
    [detailLabel setText:detail];
    [bylineLabel setText:byline];
    
    
    NSURL *URL =[NSURL URLWithString: imgUrl];
    [img sd_setImageWithURL:URL];
}

@end
