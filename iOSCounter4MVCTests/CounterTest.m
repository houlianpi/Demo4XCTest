
    // Class under test
#import "Counter.h"

    // Collaborators

    // Test support
#import <XCTest/XCTest.h>

#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>


@interface CounterTest : XCTestCase
@end

@implementation CounterTest
{
    // test fixture ivars go here
  Counter * sut;
  int modelChangedCount;
  NSInteger modelChangedValue;
}

-(void)setUp
{
  [super setUp];
  sut = [[Counter alloc]init];
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(counterModelChanged:) name:CounterModelChanged object:sut];
}

-(void)tearDown
{
  sut = nil;
  [super tearDown];
}

-(void)counterModelChanged:(NSNotification *)notification
{
  ++modelChangedCount;
  Counter *counter = (Counter *)[notification object];
  modelChangedValue = [counter count];
}

//-(void)testIncrement1ShouldYield2
//{
//  [sut setCount:1];
//  [sut increment];
//  assertThatInteger([sut count],is(equalTo(@2)));
//}
//
//-(void)testIncrement2ShouldYield3
//{
//  [sut setCount:2];
//  [sut increment];
//  assertThatInteger([sut count],is(equalTo(@3)));
//}
//
//-(void)testIncrementShouldPostModelChangedNotification
//{
//  [sut increment];
//  assertThatInt(modelChangedCount,is(equalTo(@1)));
//}
//
//-(void)testIncrementShouldPostNotificationWithCount
//{
//  [sut setCount:1];
//  [sut increment];
//  assertThatInteger(modelChangedValue,is(equalTo(@2)));
//}
//
//
//
//
//-(void)testDecrement1ShouldYield0
//{
//  [sut setCount:1];
//  [sut decrement];
//  assertThatInteger([sut count],is(equalTo(@0)));
//}
//
//-(void)testDecrement2ShouldYield1
//{
//  [sut setCount:2];
//  [sut decrement];
//  assertThatInteger([sut count],is(equalTo(@1)));
//}
//
//-(void)testDecrementShouldPostModelChangedNotification
//{
//  [sut decrement];
//  assertThatInt(modelChangedCount,is(equalTo(@1)));
//}
//
//-(void)testDecrementShouldPostNotificationWithCount
//{
//  [sut setCount:1];
//  [sut decrement];
//  assertThatInteger(modelChangedValue,is(equalTo(@0)));
//}


@end
