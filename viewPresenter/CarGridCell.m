//
//  CarGridCell.m
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarGridCell.h"

@implementation CarGridCell


@end


@implementation CarPinterestCell

- (id)initWithFrame:(CGRect)frame {
    UINib *nib = [UINib nibWithNibName:@"CarGridCell" bundle:nil];

    NSArray *topLevelObjects = [nib instantiateWithOwner:nil options:nil];

    __block CarGridCell *cell;

    [topLevelObjects enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        if ([obj isKindOfClass:[CarGridCell class]]) {
            cell = obj;
            *stop = YES;
        }
    }];
    return (id)cell;
}

@end