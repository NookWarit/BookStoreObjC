#import "HeaderView.h"

@implementation HeaderView
@synthesize backBtn;
@synthesize searchBtn;
@synthesize navigationController;


- (IBAction)backBtnDidTap:(id)sender{
    [navigationController popViewControllerAnimated:true];
}

- (IBAction)searchDidTap:(id)sender {
    
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self customInit];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customInit];
    }
    return self;
}

-(void)customInit{
        [[NSBundle mainBundle] loadNibNamed:@"HeaderView" owner:self options:nil];
    [self addSubview:self.contentView];
    [_title setText:@"The New York Time"];
    [_title setFont: [UIFont fontWithName:@"chomsky" size:18]];
    
}

-(void)configureViewwithbackhide:(BOOL)backHide withseachhide:(BOOL)seachHide navigation:(UINavigationController*)navigationController{
    [backBtn setHidden:backHide];
    [searchBtn setHidden:seachHide];
    self.navigationController = navigationController;
}

@end
