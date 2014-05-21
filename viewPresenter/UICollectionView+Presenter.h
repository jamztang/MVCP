//
//  UICollectionView+PresenterNib.h
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (Presenter)

- (void)registerNib:(UINib *)nib
       forCellClass:(Class)aClass
withReuseIdentifier:(NSString *)identifier;

- (void)registerNib:(UINib *)nib
       forCellClass:(Class)aClass
     cellIdentifier:(NSString *)cellIdentifier  // identifier specified in nib
withReuseIdentifier:(NSString *)reuseIdentifier;

@end
