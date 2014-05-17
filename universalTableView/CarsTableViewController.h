//
//  CarsTableViewController.h
//  cells
//
//  Created by James Tang on 17/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@class CarsTableViewController;

extern NSString *const CarsListCellIdentifer;
extern NSString *const CarsPhotoCellIdentifer;

@protocol CarsTableViewControllerDelegate <NSObject>

- (NSString *)carsTableViewController:(CarsTableViewController *)controller identiferForObject:(id)object atIndexPath:(NSIndexPath *)indexPath;

@end

@interface CarsTableViewController : NSObject <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak) IBOutlet UITableView *tableView;
@property (nonatomic, copy) NSArray *cars;
@property (nonatomic, copy) NSDictionary *cellMapping;

@property (nonatomic, weak) IBOutlet id <CarsTableViewControllerDelegate> delegate;

@end
