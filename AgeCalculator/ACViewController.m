//
//  ACViewController.m
//  AgeCalculator
//
//  Created by Delon Newman on 3/14/14.
//  Copyright (c) 2014 Delon Newman. All rights reserved.
//

#import "ACViewController.h"

@interface ACViewController ()
    double calculateAgeInYears(NSDate *start, NSDate *end);
    void   changeDisplayAge(UILabel *age, NSDate *start, NSDate *end);

    @property UIDatePicker *startDate;
    @property UIDatePicker *endDate;
    @property UILabel      *ageLabel;
@end

@implementation ACViewController

//
// Utility Methods
//

double calculateAgeInYears(NSDate *start, NSDate *end)
{
    NSTimeInterval interval = [end timeIntervalSinceDate: start];
    return (((interval / 60) / 60) / 24) / 365;
}

void changeDisplayAge(UILabel *age, NSDate *start, NSDate *end)
{
    double years = calculateAgeInYears(start, end);
    
    age.text = [NSString stringWithFormat:@"%1.0f years", years];
}

//
// Callbacks
//

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.startDate = (UIDatePicker *)[self.view viewWithTag:10];
    self.endDate   = (UIDatePicker *)[self.view viewWithTag:11];
    self.ageLabel  = (UILabel      *)[self.view viewWithTag:12];
    
    changeDisplayAge(self.ageLabel, self.startDate.date, self.endDate.date);
}

- (IBAction)startDateValueChanged:(id)sender {
    changeDisplayAge(self.ageLabel, self.startDate.date, self.endDate.date);
}

- (IBAction)endDateValueChanged:(id)sender {
    changeDisplayAge(self.ageLabel, self.startDate.date, self.endDate.date);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end