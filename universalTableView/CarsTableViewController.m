//
//  CarsTableViewController.m
//  cells
//
//  Created by James Tang on 17/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarsTableViewController.h"
#import "CarTableViewCell.h"
#import "Car.h"

typedef CGFloat(^CarsTableViewControllerCellHeightHandler)(id object);

NSString *const CarsListCellIdentifer = @"carListCell";
NSString *const CarsPhotoCellIdentifer = @"carPhotoCell";


@interface CarsTableViewController ()

@property (nonatomic, strong) UINib *listCellNib;
@property (nonatomic, strong) UINib *photoCellNib;
@property (nonatomic, copy) NSDictionary *prototypeCells;

@end

@implementation CarsTableViewController

- (void)awakeFromNib {
    [super awakeFromNib];

    // Default
    self.cellMapping = @{NSStringFromClass([Car class]): CarsListCellIdentifer};

    self.listCellNib = [UINib nibWithNibName:@"CarListTableViewCell"
                                      bundle:nil];
    self.photoCellNib = [UINib nibWithNibName:@"CarPhotoTableViewCell"
                                      bundle:nil];

    __weak __typeof (self) weakSelf = self;
    self.prototypeCells = @
    {
    CarsListCellIdentifer: ^(id object) {
        static CarTableViewCell *cell;
        if ( ! cell) {
            cell = (id)[weakSelf.listCellNib instantiateWithOwner:nil options:nil][0];
        }
        return cell.frame.size.height;
    },
    CarsPhotoCellIdentifer: ^(id object) {
        static CarTableViewCell *cell;
        if ( ! cell) {
            cell = (id)[weakSelf.photoCellNib instantiateWithOwner:nil options:nil][0];
        }
        return cell.frame.size.height;
    }
    };

}

#pragma mark Helper

- (void)registerNibsWithTableView:(UITableView *)tableView {
    [tableView registerNib:self.listCellNib
    forCellReuseIdentifier:CarsListCellIdentifer];
    [tableView registerNib:self.photoCellNib
    forCellReuseIdentifier:CarsPhotoCellIdentifer];
}

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath {
    id object = self.cars[indexPath.row];

    NSString *identifier;
    if (self.delegate) {
        identifier = [self.delegate carsTableViewController:self
                                   identiferForObject:object
                                          atIndexPath:indexPath];
    } else {
        identifier = self.cellMapping[NSStringFromClass([object class])];
    }

    return identifier;
}

#pragma mark Overrides

- (void)setTableView:(UITableView *)tableView {
    _tableView = tableView;
    [self registerNibsWithTableView:tableView];
}

- (void)setCars:(NSArray *)cars {
    _cars = [cars copy];
    [_tableView reloadData];
}

#pragma mark UITableViewDataSource

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

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
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
    cell.descLabel.text = car.desc;
    cell.frontImageView.image = [UIImage imageNamed:car.imageNamed];
}

#pragma mark UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    id object = self.cars[indexPath.row];

    NSString *identifier = [self identifierAtIndexPath:indexPath];

    CarsTableViewControllerCellHeightHandler handler = self.prototypeCells[identifier];
    return handler(object);
}

@end
