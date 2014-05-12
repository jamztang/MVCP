//
//  Car.h
//  cells
//
//  Created by James Tang on 12/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Car : NSObject

@property (nonatomic, copy) NSNumber *year;
@property (nonatomic, copy) NSString *make;
@property (nonatomic, copy) NSString *modal;
@property (nonatomic, copy) NSString *imageNamed;

+ (Car *)carWithYear:(NSNumber *)year
                make:(NSString *)make
               modal:(NSString *)modal
          imageNamed:(NSString *)imageNamed;

@end
