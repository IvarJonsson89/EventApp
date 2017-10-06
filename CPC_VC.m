//
//  CPC_VC.m
//  EventApp
//
//  Created by forever on 8/28/17.
//  Copyright © 2017 forever. All rights reserved.
//

#import "CPC_VC.h"
#import <EMCCountryPickerController.h>

@interface CPC_VC ()

@end

@implementation CPC_VC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (void)countryController:(id)sender didSelectCountry:(EMCCountry *)chosenCity
{

    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"openCountryPicker"])
    {
        EMCCountryPickerController *countryPicker = segue.destinationViewController;
        
        // default values
        countryPicker.showFlags = true;
        countryPicker.countryDelegate = self;
        countryPicker.drawFlagBorder = true;
        countryPicker.flagBorderColor = [UIColor grayColor];
        countryPicker.flagBorderWidth = 0.5f;
        
//        if ([self.smallFlagsSwitch isOn])
//        {
//            countryPicker.flagSize = 20;
//        }
//        
//        if (![self.allCountriesSwitch isOn])
//        {
//            countryPicker.availableCountryCodes = [NSSet setWithObjects:@"IT", @"ES", @"US", @"FR", nil];
//        }
    }
}

@end
