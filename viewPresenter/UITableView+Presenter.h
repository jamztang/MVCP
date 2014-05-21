//
//  UITableView+Presenter.h
//  cells
//
//  Created by James Tang on 21/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (Presenter)

- (void)registerNib:(UINib *)nib
       forCellClass:(Class)aClass
            atIndex:(NSUInteger)index
withReuseIdentifier:(NSString *)identifier;

@end
