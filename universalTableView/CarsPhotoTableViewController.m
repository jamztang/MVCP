//
//  CarsBaseTableViewController.m
//  cells
//
//  Created by James Tang on 17/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarsPhotoTableViewController.h"
#import "Car.h"
#import "CarsTableViewController.h"

@interface CarsPhotoTableViewController () <CarsTableViewControllerDelegate>

@property (nonatomic, copy) NSArray *cars;

@end

@implementation CarsPhotoTableViewController

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
                  [Car carWithYear:@(2014)
                              make:@"Tesla"
                             modal:@"Model S"
                              desc:@"The Tesla Model S is a full-sized electric five-door liftback produced by Tesla Motors. First shown to the public at the 2009 Frankfurt Motor Show as a prototype, retail deliveries started in the United States in June 2012.[7] The Model S was released in Europe in early August 2013, and the first deliveries took place in Norway, Switzerland and the Netherlands.[8]"
                        imageNamed:@"tesla.jpg"
                   ],
                  ];

    self.tableViewController.cellMapping = @{@"Car":CarsPhotoCellIdentifer};
    self.tableViewController.cars = self.cars;
}

#pragma mark CarsTableViewControllerDelegate

- (NSString *)carsTableViewController:(CarsTableViewController *)controller identiferForObject:(id)object atIndexPath:(NSIndexPath *)indexPath {

    if (indexPath.row >= 1) {
        return CarsListCellIdentifer;
    }

    return CarsPhotoCellIdentifer;
}

@end
