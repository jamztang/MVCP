//
//  PresenterCollectionViewCell.h
//

#import <UIKit/UIKit.h>
@class Presenter;

@interface PresenterCollectionViewCell : UICollectionViewCell

@property (strong, nonatomic) IBOutlet Presenter *presenter;

@end
