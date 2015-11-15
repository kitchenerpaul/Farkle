//
//  DieLabel.h
//  NewFarkle
//
//  Created by Paul Kitchener on 10/11/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DieLabel;
@protocol DieLabelDelegate <NSObject>

-(void)dieLabelTapped:(DieLabel *)dieLabel;

@end

@interface DieLabel : UILabel

@property (nonatomic, assign) id<DieLabelDelegate> delegate;

-(void)dieRoll;
@property BOOL dieSelected;


@end