//
//  ViewController.m
//  MemoryManagement
//
//  Created by Paul Solt on 1/29/20.
//  Copyright © 2020 Lambda, Inc. All rights reserved.
//

#import "ViewController.h"
#import "Car.h"
#import "Person.h"
//#import "LSILog.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSMutableArray *array = [[NSMutableArray alloc] init];
    
    for (NSInteger index = 0; index < 10; index++) {
        NSMutableString *string = [[NSMutableString alloc] initWithString:@"Starting Value"];
        
        [array addObject:string];
        
        [string release];
    }
    
    NSMutableString *firstString = [array objectAtIndex:0];
    [firstString retain];
    NSLog(@"The string is %@", firstString);
    
    [array release];
    
    NSMutableArray *anotherArray = [[NSMutableArray alloc] init];
    NSMutableString *anotherString = [[NSMutableString alloc] initWithString:@"The user's password"];
    [anotherArray addObject:anotherString];
    
    NSLog(@"The string is still %@", firstString);
    [firstString release];
    
    Person *me = [[Person alloc] init];
    Car *honda = [[Car alloc] initWithMake:@"Civic Si"];
    me.car = honda;
    
    [honda release];
    
    Car *anotherCar = me.car;
    
    me.car = anotherCar;
    
    NSLog(@"My car is: %@", me.car);
    [me release];
}


@end
