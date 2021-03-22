//
//  HeaderView.m
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import "HeaderView.h"

@implementation HeaderView
@synthesize backBtn;
@synthesize searchBtn;
@synthesize navigationController;

- (void)backBtnDidTap:(UIButton *)sender{
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

-(void)configureView:(BOOL*)backHide :(BOOL*)seachHide :(UINavigationController*)navigationController{
    [backBtn setHidden:backHide];
    [searchBtn setHidden:seachHide];
    self.navigationController = navigationController;
}

@end
