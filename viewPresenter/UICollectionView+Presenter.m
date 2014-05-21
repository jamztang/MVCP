//
//  UICollectionView+PresenterNib.m
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "UICollectionView+Presenter.h"
#import "NSObject+Subclass.h"

@implementation UICollectionView (Presenter)

- (void)registerNib:(UINib *)nib
       forCellClass:(Class)aClass
withReuseIdentifier:(NSString *)identifier {
    [self registerNib:nib
         forCellClass:aClass
       cellIdentifier:identifier
  withReuseIdentifier:identifier];
}

- (void)registerNib:(UINib *)nib
       forCellClass:(Class)aClass
     cellIdentifier:(NSString *)cellIdentifier
withReuseIdentifier:(NSString *)reuseIdentifier {

    NSString *className = [NSString stringWithFormat:@"%@-%@", NSStringFromClass(aClass), cellIdentifier];
    __strong Class newClass = NSClassFromString(className);

    if ( ! newClass) {
        newClass =[aClass newSubclassNamed:className
                                 protocols:NULL
                                     impls:PAIR_LIST {
                                         @selector(initWithFrame:),
                                         BLOCK_CAST ^id (id frame) {

                                             NSArray *topLevelObjects = [nib instantiateWithOwner:nil options:nil];

                                             __block UICollectionViewCell *cell;

                                             [topLevelObjects enumerateObjectsUsingBlock:^(UICollectionViewCell *obj, NSUInteger idx, BOOL *stop) {
                                                 if ([obj isKindOfClass:aClass]) {
                                                     cell = obj; // forgiving to nibs that has only one cell without specifying identifiers
                                                     if ([obj.reuseIdentifier isEqualToString:cellIdentifier]) {
                                                         *stop = YES;
                                                     }
                                                 }
                                             }];

                                             NSAssert2(cell != nil, @"%s: couldn't find any cell with identifier \"%@\" in the nib file.", __PRETTY_FUNCTION__, cellIdentifier);

                                             return cell;
                                         },
                                         NIL_PAIR
                                     }];
    }

    [self registerClass:newClass forCellWithReuseIdentifier:reuseIdentifier];

}

@end
