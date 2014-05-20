//
//  ViewController.h
//  universalTableView
//
//  Created by James Tang on 15/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarNibRegistrator;
@class CarsTableViewController;

@interface CarsListViewController : UITableViewController
@property (strong, nonatomic) IBOutlet CarNibRegistrator *listCellNibRegistrator;

@end
