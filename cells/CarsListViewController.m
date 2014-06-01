//
//  ViewController.m
//  cells
//
//  Created by James Tang on 12/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarsListViewController.h"
#import "Car.h"
#import "PresenterTableViewCell.h"
#import "CarPresenter.h"
#import "CarDetailViewController.h"

@interface CarsListViewController ()

@property (nonatomic, copy) NSArray *cars;

@end

@implementation CarsListViewController

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"carDetailScene"]) {
        CarDetailViewController *controller = segue.destinationViewController;
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Car *car = self.cars[indexPath.row];
        controller.car = car;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];

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
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"carListCell"
                                                            forIndexPath:indexPath];

    [self configureCell:(PresenterTableViewCell *)cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(PresenterTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    Car *car = self.cars[indexPath.row];
    cell.presenter.model = car;
}

@end
