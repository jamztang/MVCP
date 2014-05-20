//
//  UICollectionView+PresenterNib.h
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UICollectionView (PresenterNib)

- (void)registerNib:(UINib *)nib
        targetClass:(Class)aClass
              index:(NSUInteger)index
forCellWithReuseIdentifier:(NSString *)identifier;

@end
