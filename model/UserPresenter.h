//
//  UserPresenter
//

#import <Foundation/Foundation.h>
#import "Presenter.h"

@interface UserPresenter : Presenter

@property (weak, nonatomic) IBOutlet UILabel *firstNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *lastNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@end
