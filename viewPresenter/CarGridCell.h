//
//  CarGridCell.h
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarPresenter;

@interface CarGridCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet CarPresenter *carPresenter;

@end



@interface CarPinterestCell : CarGridCell

@end