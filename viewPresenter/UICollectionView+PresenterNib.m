//
//  UICollectionView+PresenterNib.m
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "UICollectionView+PresenterNib.h"
#import "NSObject+Subclass.h"

@implementation UICollectionView (PresenterNib)

- (void)registerNib:(UINib *)nib
        targetClass:(Class)aClass
              index:(NSUInteger)index
forCellWithReuseIdentifier:(NSString *)identifier {

    NSString *className = [NSString stringWithFormat:@"%@-%lu", NSStringFromClass(aClass), (unsigned long)index];
    __strong Class newClass = NSClassFromString(className);

    if ( ! newClass) {
        newClass =[aClass newSubclassNamed:className
                                 protocols:NULL
                                     impls:PAIR_LIST {
                                         @selector(initWithFrame:),
                                         BLOCK_CAST ^id (id frame) {

                                             NSArray *topLevelObjects = [nib instantiateWithOwner:nil options:nil];

                                             __block id cell;
                                             __block NSUInteger count = 0;

                                             [topLevelObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
                                                 if ([obj isKindOfClass:aClass]) {
                                                     if (count == index) {
                                                         cell = obj;
                                                         *stop = YES;
                                                     } else {
                                                         count++;
                                                     }
                                                 }
                                             }];
                                             return cell;
                                         },
                                         NIL_PAIR
                                     }];
    }

    [self registerClass:newClass forCellWithReuseIdentifier:identifier];

}

@end
