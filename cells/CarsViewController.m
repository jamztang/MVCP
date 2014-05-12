//
//  ViewController.m
//  cells
//
//  Created by James Tang on 12/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarsViewController.h"
#import "Car.h"
#import "CarTableViewCell.h"

@interface CarsViewController ()

@property (nonatomic, copy) NSArray *cars;

@end

@implementation CarsViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.cars = @[
                  [Car carWithYear:@(2014)
                              make:@"Tesla"
                             modal:@"S"
                        imageNamed:@"tesla.jpg"
                   ],
                  [Car carWithYear:@(2008)
                              make:@"Mini Cooper"
                             modal:@"S"
                        imageNamed:@"mini-cooper.jpg"
                   ],
                  ];
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.cars count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"carCell"
                                                            forIndexPath:indexPath];

    [self configureCell:(CarTableViewCell *)cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(CarTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Car *car = self.cars[indexPath.row];

    cell.yearLabel.text = [NSString stringWithFormat:@"%@", car.year];
    cell.modalLabel.text = car.modal;
    cell.makeLabel.text = car.make;
    cell.frontImageView.image = [UIImage imageNamed:car.imageNamed];
}

@end
