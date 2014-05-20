//
//  CarsBaseTableViewController.h
//  cells
//
//  Created by James Tang on 17/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CarsTableViewController;
@class CarNibRegistrator;

@interface CarsPhotoTableViewController : UITableViewController

@property (strong, nonatomic) IBOutlet CarNibRegistrator *photoNibRegistrator;

@end
