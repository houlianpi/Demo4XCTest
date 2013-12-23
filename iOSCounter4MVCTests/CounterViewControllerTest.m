

    // Class under test
#import "CounterViewController.h"
#import "Counter.h"

    // Collaborators

    // Test support
#import <XCTest/XCTest.h>


#define HC_SHORTHAND
#import <OCHamcrestIOS/OCHamcrestIOS.h>

#define MOCKITO_SHORTHAND
#import <OCMockitoIOS/OCMockitoIOS.h>

@interface CounterViewControllerTest : XCTestCase
@end

@implementation CounterViewControllerTest
{
    // test fixture ivars go here
  CounterViewController *sut;
  Counter *mockCounter;
}

-(void)setUp{
  [super setUp];
  mockCounter = mock([Counter class]);
  sut  = [[CounterViewController alloc]initWithCounter:mockCounter];
  [sut view];
}

-(void)tearDown{
  sut = nil;
  [super tearDown];
}

-(void)testCountLabelShuoldBeConnected
{
  assertThat([sut counterLabel],is(notNilValue()));
}

-(void)testPlusButtonShuoldBeConnected
{
  assertThat([sut plusButton],is(notNilValue()));
}

-(void)testMinusButtonShuoldBeConnected
{
  assertThat([sut minusButton],is(notNilValue()));
}

-(void)testPlusButtonAction
{
  UIButton * button =  [sut plusButton];
  assertThat([button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside],contains(@"incrementCount:",nil));
}

-(void)testMinusButtonAction
{
  UIButton * button =  [sut minusButton];
  assertThat([button actionsForTarget:sut forControlEvent:UIControlEventTouchUpInside],contains(@"minusCount:",nil));
}

-(void)testIncrementCountShouldAdkCounterToIncrement
{
  [sut incrementCount:nil];
  [verify(mockCounter) increment];
}

-(void)testDecrementCountShouldAdkCounterToDecrement
{
  [sut minusCount:nil];
  [verify(mockCounter) decrement];
}


-(void)testInitialCountLableShouldBeZero
{
  [given([mockCounter count]) willReturnInteger:42];
  
  [sut viewWillAppear:NO];
  assertThat([[sut counterLabel] text],is(@"42"));
}

-(void)testModleChangedNotificationShouldUpdateCountLabel
{
  [given([mockCounter count]) willReturnInteger:2];
  
  [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:mockCounter];
  
  assertThat([[sut counterLabel] text],is(@"2"));
}

-(void)testModleChangedNotificationFromDifferentModleShouldNotUpdateCounter
{
  [given([mockCounter count]) willReturnInteger:2];
  Counter * differentCounter = [[Counter alloc]init];
  [differentCounter setCount:3];
  [[NSNotificationCenter defaultCenter] postNotificationName:CounterModelChanged object:differentCounter];
  assertThat([[sut counterLabel] text], is(@"0"));
}

//-(void)testIncrementCountOnceShuoldAddOneTOCountLable
//{
//  [sut incrementCount:nil];
//  assertThat([[sut counterLabel] text],is(@"1"));
//}
//
//-(void)testIncrementCountTwiceShuoldAddTwoToCountLable
//{
//  [sut incrementCount:nil];
//  [sut incrementCount:nil];
//  assertThat([[sut counterLabel] text],is(@"2"));
//}

//-(void)testMinusCountOnceShuoldAddOneTOCountLable
//{
//  [sut minusCount:nil];
//  assertThat([[sut counterLabel] text],is(@"-1"));
//}
//
//-(void)testMinusCountTwiceShuoldAddTwoToCountLable
//{
//  [sut minusCount:nil];
//  [sut minusCount:nil];
//  assertThat([[sut counterLabel] text],is(@"-2"));
//}

@end
