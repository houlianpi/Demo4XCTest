//
//  CounterViewController.m
//  iOSCounter4MVC
//
//  Created by 芈峮 on 13-4-10.
//  Copyright (c) 2013年 xxxxx. All rights reserved.
//

#import "CounterViewController.h"

@interface CounterViewController ()

@end

@implementation CounterViewController
{
  //NSInteger count;
  Counter * _counter;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
- (id)initWithCounter:(Counter *)counter
{
  self = [super init];
  if(self){
    _counter = counter;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(modelChanged:) name:CounterModelChanged object:_counter];
  }
  return self;
}

-(void)dealloc
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
  [self modelChanged:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementCount:(id)sender {
//  ++count;
//  [self updateCountLabel];
  [_counter increment];
}

- (IBAction)minusCount:(id)sender {
//  --count;
//  [self updateCountLabel];
  [_counter decrement];
}

//-(void)updateCountLabel
//{
//  [_counterLabel setText:[NSString stringWithFormat:@"%d",count]];
//}

-(void)modelChanged:(NSNotification *)notification
{
  [_counterLabel setText:[NSString stringWithFormat:@"%d",[_counter count]]];
}

@end
