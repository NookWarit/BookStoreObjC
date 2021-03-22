#import "BookCollectionViewCell.h"
#import "SDWebImage/SDWebImage.h"

@implementation BookCollectionViewCell
@synthesize cardView;
@synthesize bgView;
@synthesize img;
@synthesize title;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)configureCell:(NSString*)title :(NSString*)imgUrl{
    
    [img sd_setImageWithURL:imgUrl];
}

@end
