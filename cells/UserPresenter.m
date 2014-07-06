//
//  UserPresenter.m
//  cells
//
//  Created by James Tang on 1/6/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import "UserPresenter.h"
#import "User.h"

@implementation UserPresenter

- (void)reloadData {
    User *user = self.model;
    self.ageLabel.text = [NSString stringWithFormat:@"%@", user.age];
    self.lastNameLabel.text = user.lastName;
    self.firstNameLabel.text = user.firstName;
}

@end
