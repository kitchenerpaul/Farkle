//
//  DieLabel.m
//  NewFarkle
//
//  Created by Paul Kitchener on 10/11/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "DieLabel.h"


@implementation DieLabel

-(IBAction)onTap:(UITapGestureRecognizer *)tap {

    [self.delegate dieLabelTapped:self];
}

-(void)dieRoll {
    int randomNumber = (arc4random()%6) + 1;
    self.text = [@(randomNumber) stringValue];
}


@end
