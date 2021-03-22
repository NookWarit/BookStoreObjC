//
//  HeaderView.h
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface HeaderView : UIView
@property (strong, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UIButton *backBtn;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UIButton *searchBtn;
@property (weak, nonatomic) UINavigationController *navigationController;

- (IBAction)backBtnDidTap:(UIButton *)sender;
- (IBAction)searchDidTap:(id)sender;

-(void)configureView:(BOOL*)backHide :(BOOL*)seachHide :(UINavigationController*)navigationController;

@end

NS_ASSUME_NONNULL_END
