//
//  CarTableViewCell+Car.m
//  cells
//
//  Created by James Tang on 15/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "CarTableViewCell+Car.h"
#import "Car.h"

@implementation CarTableViewCell (Car)

- (void)setCar:(Car *)car {
    self.yearLabel.text = [NSString stringWithFormat:@"%@", car.year];
    self.modalLabel.text = car.modal;
    self.makeLabel.text = car.make;
    self.descLabel.text = car.desc;
    self.frontImageView.image = [UIImage imageNamed:car.imageNamed];
}

@end
