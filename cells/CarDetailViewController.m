//
//  CarDetailViewController.m
//  cells
//
//  Created by James Tang on 1/6/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarDetailViewController.h"
#import "PresenterView.h"
#import "CarPresenter.h"
#import "PresenterTableViewCell.h"

@interface CarDetailViewController ()

@property (weak, nonatomic) IBOutlet PresenterView *titleView;
@property (copy, nonatomic) NSArray *rows;

@end

@implementation CarDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.rows = @[@"carPhotoCell"
                  , @"carDescCell"
                  ];

    self.titleView.presenter.model = self.car;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section
{
    return [self.rows count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = self.rows[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier
                                                            forIndexPath:indexPath];

    [self configureCell:(id)cell forRowAtIndexPath:indexPath];

    return cell;
}

- (void)configureCell:(PresenterTableViewCell *)cell
    forRowAtIndexPath:(NSIndexPath *)indexPath
{
    cell.presenter.model = self.car;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *identifier = self.rows[indexPath.row];
    if ([identifier isEqualToString:@"carPhotoCell"]) {
        return 198;
    } else if ([identifier isEqualToString:@"carDescCell"]) {
        // It should really be calculating the actual size of the description text, but this is out of our scope.
        return 220;
    }
    return 0;
}

@end
