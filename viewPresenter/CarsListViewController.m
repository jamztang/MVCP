//
//  ViewController.m
//  universalTableView
//
//  Created by James Tang on 15/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarsListViewController.h"
#import "Car.h"
#import "CarNibRegistrator.h"
#import "CarPresenter.h"
#import "CarTableViewCell.h"
#import "UITableView+Presenter.h"

@interface CarsListViewController ()

@property (nonatomic, copy) NSArray *cars;

@end

@implementation CarsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    UINib *nib = [UINib nibWithNibName:@"CarListTableViewCell" bundle:nil];
    [self.tableView registerNib:nib
                   forCellClass:[CarTableViewCell class]
                        atIndex:0
            withReuseIdentifier:@"listCell"];

    self.cars = @[
                  [Car carWithYear:@(2014)
                              make:@"Tesla"
                             modal:@"Model S"
                              desc:@"The Tesla Model S is a full-sized electric five-door liftback produced by Tesla Motors. First shown to the public at the 2009 Frankfurt Motor Show as a prototype, retail deliveries started in the United States in June 2012.[7] The Model S was released in Europe in early August 2013, and the first deliveries took place in Norway, Switzerland and the Netherlands.[8]"
                        imageNamed:@"tesla.jpg"
                   ],
                  [Car carWithYear:@(2008)
                              make:@"Mini"
                             modal:@"Cooper S"
                              desc:@"Issigonis' friend John Cooper, owner of the Cooper Car Company and designer and builder of Formula One and rally cars, saw the potential of the Mini for competition. Issigonis was initially reluctant to see the Mini in the role of a performance car, but after John Cooper appealed to BMC management, the two men collaborated to create the Mini Cooper. The Austin Mini Cooper and Morris Mini Cooper debuted in 1961."
                        imageNamed:@"mini-cooper.jpg"
                   ],
                  ];

}

#pragma mark Helper

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath {
    return @"listCell";
}

#pragma mark UITableViewDatasource


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

    NSString *identifier = [self identifierAtIndexPath:indexPath];

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    [self configureCell:(id)cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(CarTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    id object = self.cars[indexPath.row];
    CarPresenter *presenter = cell.presenter;
    presenter.car = object;
}

@end
