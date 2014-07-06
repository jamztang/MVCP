//
//  CarPresenter.m
//  cells
//
//  Created by James Tang on 18/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarPresenter.h"
#import "Car.h"

@implementation CarPresenter

- (void)reloadData{
    Car *car = self.model;
    self.yearLabel.text = [NSString stringWithFormat:@"%@", car.year];
    self.modalLabel.text = car.modal;
    self.makeLabel.text = car.make;
    self.descLabel.text = car.desc;
    self.frontImageView.image = [UIImage imageNamed:car.imageNamed];
}

@end
