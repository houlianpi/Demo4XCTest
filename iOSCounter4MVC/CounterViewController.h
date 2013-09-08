//
//  CounterViewController.h
//  iOSCounter4MVC
//
//  Created by 芈峮 on 13-4-10.
//  Copyright (c) 2013年 xxxxx. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Counter.h"

@interface CounterViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *counterLabel;
@property (strong, nonatomic) IBOutlet UIButton *plusButton;
@property (strong, nonatomic) IBOutlet UIButton *minusButton;
- (IBAction)incrementCount:(id)sender;
- (IBAction)minusCount:(id)sender;
- (id)initWithCounter:(Counter *)counter;

@end
