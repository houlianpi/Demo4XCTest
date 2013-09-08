//
//  Counter.m
//  iOSCounter4MVC
//
//  Created by 芈峮 on 13-4-10.
//  Copyright (c) 2013年 xxxxx. All rights reserved.
//

#import "Counter.h"

NSString *const CounterModelChanged = @"CounterModelChanged";
NSString *const countInDefaultID = @"currentId";

@implementation Counter
{
  NSUserDefaults * _defaults;
}

-(id)initWithUserDefault:(NSUserDefaults *) defaults
{
  self = [super init];
  if (self) {
    _defaults = defaults;
    _count = [self getCountInDefaults];
  }
  return self;

}
-(NSInteger)getCountInDefaults
{
  NSNumber * reminderId = [_defaults objectForKey:countInDefaultID];
  if (reminderId) {
    reminderId =  reminderId;
  } else {
    reminderId = @0;
  }
  return [reminderId integerValue];
}


-(void)increment
{
  _count = [self getCountInDefaults] + 1 ;
  [_defaults setObject:[NSNumber numberWithInteger:_count] forKey:countInDefaultID];
  [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:self];
}

-(void)decrement
{
  _count = [self getCountInDefaults] - 1;
  [_defaults setObject:[NSNumber numberWithInteger:_count] forKey:countInDefaultID];
  [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:self];
}



@end
