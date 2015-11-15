//
//  ViewController.m
//  NewFarkle
//
//  Created by Paul Kitchener on 10/11/15.
//  Copyright © 2015 Paul Kitchener. All rights reserved.
//

#import "ViewController.h"
#import "DieLabel.h"

@interface ViewController () <DieLabelDelegate>

@property (weak, nonatomic) IBOutlet DieLabel *dieLabel1;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel2;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel3;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel4;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel5;
@property (weak, nonatomic) IBOutlet DieLabel *dieLabel6;

@property (weak, nonatomic) IBOutlet UILabel *userScore;

@property NSMutableArray *selectedDice;
@property NSMutableArray *unselectedDice;

@property int unselectedDiceScore;
@property int selectedDiceScore;
@property int numberOfRolls;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.unselectedDice = [NSMutableArray arrayWithObjects: self.dieLabel1, self.dieLabel2, self.dieLabel3, self.dieLabel4, self.dieLabel5, self.dieLabel6, nil];
    self.selectedDice = [NSMutableArray arrayWithCapacity:self.unselectedDice.count];

    for (DieLabel *dieLabel in self.unselectedDice) {
        dieLabel.hidden = YES;
        dieLabel.delegate = self;
    }

}

-(void)dieLabelTapped:(DieLabel *)dieLabel {

    if (dieLabel.dieSelected == NO)
    {

        [self.selectedDice addObject:dieLabel];
        dieLabel.backgroundColor = [UIColor blackColor];
        [self.unselectedDice removeObject:dieLabel];
        [self calculateScore:self.selectedDice labelToDisplayScore:self.userScore];
    }

    dieLabel.dieSelected = !dieLabel.dieSelected;

}

- (IBAction)onRollPressed:(id)sender {

    for (DieLabel *dieLabel in self.unselectedDice) {
        dieLabel.hidden = NO;
        [dieLabel dieRoll];
    }

 }

-(void)calculateScore:(NSMutableArray *)score labelToDisplayScore:(UILabel *)label{

    for (int i = 0; i<score.count; i++) {

        int localDiceTallyForOne = 0;
        int localDiceTallyForTwo = 0;
        int localDiceTallyForThree = 0;
        int localDiceTallyForFour = 0;
        int localDiceTallyForFive = 0;
        int localDiceTallyForSix = 0;
        self.unselectedDiceScore = 0;

        for (DieLabel *dieRolled in score) {

            switch (dieRolled.text.intValue) {
                case 1:
                    localDiceTallyForOne++;
                    break;

                case 2:
                    localDiceTallyForTwo++;
                    break;

                case 3:
                    localDiceTallyForThree++;
                    break;

                case 4:
                    localDiceTallyForFour++;
                    break;

                case 5:
                    localDiceTallyForFive++;
                    break;

                case 6:
                    localDiceTallyForSix++;
                    break;

                default:
                    break;
            }

        }
        self.unselectedDiceScore = (localDiceTallyForFive * 50) + (localDiceTallyForOne *100);

        if (localDiceTallyForOne == 6) {
            self.unselectedDiceScore += 2400;
        } else if(localDiceTallyForOne == 5) {
            self.unselectedDiceScore += 1500;
        } else if (localDiceTallyForOne == 4) {
            self.unselectedDiceScore += 600;
        }

        if (localDiceTallyForFive == 6) {
            self.unselectedDiceScore += 2700;
        } else if(localDiceTallyForFive == 5) {
            self.unselectedDiceScore += 1750;
        } else if (localDiceTallyForFive == 4) {
            self.unselectedDiceScore += 800;
        } else if (localDiceTallyForFive == 3) {
            self.unselectedDiceScore += 350;
        }

        if (localDiceTallyForTwo == 6) {
            self.unselectedDiceScore += 3000;
        } else if(localDiceTallyForTwo == 5) {
            self.unselectedDiceScore += 2000;
        } else if (localDiceTallyForTwo == 4) {
            self.unselectedDiceScore += 1000;
        } else if (localDiceTallyForTwo == 3) {
            self.unselectedDiceScore += 200;
        }

        if (localDiceTallyForThree == 6) {
            self.unselectedDiceScore += 3000;
        } else if(localDiceTallyForThree == 5) {
            self.unselectedDiceScore += 2000;
        } else if (localDiceTallyForThree == 4) {
            self.unselectedDiceScore += 1000;
        } else if (localDiceTallyForThree == 3) {
            self.unselectedDiceScore += 300;
        }

        if (localDiceTallyForFour == 6) {
            self.unselectedDiceScore += 3000;
        } else if(localDiceTallyForFour == 5) {
            self.unselectedDiceScore += 2000;
        } else if (localDiceTallyForFour == 4) {
            self.unselectedDiceScore += 1000;
        } else if (localDiceTallyForFour == 3) {
            self.unselectedDiceScore += 400;
        }

        if (localDiceTallyForSix == 6) {
            self.unselectedDiceScore += 3000;
        } else if(localDiceTallyForSix == 5) {
            self.unselectedDiceScore += 2000;
        } else if (localDiceTallyForSix == 4) {
            self.unselectedDiceScore += 1000;
        } else if (localDiceTallyForSix == 3) {
            self.unselectedDiceScore += 600;
        }
        
    }
    
    label.text = @(self.unselectedDiceScore).description;
    
}



@end
