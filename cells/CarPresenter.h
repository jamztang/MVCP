//
//  CarPresenter.h
//

#import <Foundation/Foundation.h>
#import "Presenter.h"

@interface CarPresenter : Presenter

@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *makeLabel;
@property (weak, nonatomic) IBOutlet UILabel *modalLabel;
@property (weak, nonatomic) IBOutlet UILabel *descLabel;
@property (weak, nonatomic) IBOutlet UIImageView *frontImageView;

@end
