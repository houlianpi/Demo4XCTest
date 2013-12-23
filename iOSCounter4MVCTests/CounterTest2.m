//
//  iOSCounter4MVC - CounterTest2.m
//  Copyright 2013年 xxxxx. All rights reserved.
//
//  Created by: 芈峮
//

    // Class under test
#import "Counter.h"

    // Collaborators

    // Test support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>


@interface CounterTest2 : XCTestCase
@end

@implementation CounterTest2
{
  Counter * sut;
  NSUserDefaults * mockDefaults;
  int modelChangedCount;
  NSInteger modelChangedValue;
}
-(void)setUp
{
  [super setUp];
  mockDefaults= mock([NSUserDefaults class]);
  sut = [[Counter alloc]initWithUserDefault:mockDefaults];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(counterModelChanged:) name:CounterModelChanged object:sut];
}

-(void)tearDown
{
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  sut = nil;
  [super tearDown];
}

-(void)counterModelChanged:(NSNotification *)notification
{
  ++modelChangedCount;
  Counter *counter = (Counter *)[notification object];
  modelChangedValue = [counter count];
}

- (void)testInitShouldNotReturnNil
{
  Counter * counter = [[Counter alloc]initWithUserDefault:[NSUserDefaults standardUserDefaults]];
  
  assertThat(counter,instanceOf([Counter class]));
}

-(void)testGetCountInDefaultsWithNilShouldReturnZero
{
  [given([mockDefaults objectForKey:@"currentId"]) willReturn:nil];
  assertThatInteger([sut getCountInDefaults],equalToInteger(0));
}

-(void)testGetCountInDefaultsWithNumberThreeShouldReturnIntegerThree
{
  [given([mockDefaults objectForKey:@"currentId"]) willReturn:@3];
  assertThatInteger([sut getCountInDefaults],equalToInteger(3));
}

-(void)testIncrementShouldInvokeSetObject
{
  [given([mockDefaults objectForKey:@"currentId"]) willReturn:@3];
  [sut increment];
  [verify(mockDefaults) setObject:@4 forKey:@"currentId"];
}

-(void)testIncrementShouldPostNotification
{
  [given([mockDefaults objectForKey:@"currentId"]) willReturn:@3];
  [sut increment];
  assertThatInt(modelChangedCount,is(equalToInt(1)));
  assertThatInteger(modelChangedValue,is(equalToInteger(4)));
}

@end
