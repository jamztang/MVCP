//
//  CarNibRegistrator.m
//  cells
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarNibRegistrator.h"

@interface CarNibRegistrator ()

@property (nonatomic, strong) UITableViewCell *prototypeCell;

@end

@implementation CarNibRegistrator

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    [self registerIfNecessary];
}


- (UINib *)nib {
    if ( ! _nib) {
        _nib = [UINib nibWithNibName:_nibName
                              bundle:nil];
    }

    return _nib;
}

- (UITableViewCell *)prototypeCell {
    if ( ! _prototypeCell) {
        _prototypeCell = (id)[self.nib instantiateWithOwner:nil options:nil];
    }
    return _prototypeCell;
}

- (void)setRegisterNib:(BOOL)registerNib {
    _registerNib = registerNib;
    [self registerIfNecessary];
}

- (void)registerIfNecessary {
    if (_registerNib && _tableView) {
        [_tableView registerNib:self.nib forCellReuseIdentifier:_cellIdentifier];
    }
}

@end
