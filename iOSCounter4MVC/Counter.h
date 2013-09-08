//
//  Counter.h
//  iOSCounter4MVC
//
//  Created by 芈峮 on 13-4-10.
//  Copyright (c) 2013年 xxxxx. All rights reserved.
//
extern  NSString *const CounterModelChanged;

#import <Foundation/Foundation.h>

@interface Counter : NSObject

@property (nonatomic) NSInteger count;

-(id)initWithUserDefault:(NSUserDefaults *) defaults;

-(void)increment;

-(void)decrement;

-(NSInteger)getCountInDefaults;
@end
