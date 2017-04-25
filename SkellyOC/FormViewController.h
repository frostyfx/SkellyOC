//
//  FormViewController.h
//  SkellyOC
//
//  Created by Andrew Greteman on 4/24/17.
//  Copyright © 2017 frostyFX. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FormViewController : UIViewController

@property (nonatomic, weak) IBOutlet UITextField *myText;
@property (nonatomic, weak) IBOutlet UIDatePicker *myDate;
@property (nonatomic, weak) IBOutlet UIButton *resetButton;
@property (nonatomic, weak) IBOutlet UIButton *submitButton;

@end


