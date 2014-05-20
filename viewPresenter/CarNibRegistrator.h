//
//  CarNibRegistrator.h
//  cells
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CarNibRegistrator : NSObject

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSString *cellIdentifier;
@property (nonatomic, copy) NSString *nibName;
@property (nonatomic, strong) UINib *nib;
@property (nonatomic, strong, readonly) UITableViewCell *prototypeCell;
@property (nonatomic) BOOL registerNib;

@end
