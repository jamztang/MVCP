//
//  Car.m
//  cells
//
//  Created by James Tang on 12/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "Car.h"

@implementation Car

+ (Car *)carWithYear:(NSNumber *)year
                make:(NSString *)make
               modal:(NSString *)modal
                desc:(NSString *)desc
          imageNamed:(NSString *)imageNamed {
    Car *car = [[Car alloc] init];
    car.year = year;
    car.make = make;
    car.modal = modal;
    car.desc = desc;
    car.imageNamed = imageNamed;
    return car;
}

@end
