//
//  ViewController.m
//  adas
//
//  Created by  su on 16/3/12.
//  Copyright © 2016年 jiangsu. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "Person+CoreDataProperties.h"
#import "AppDelegate.h"
@class Person;
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
}
- (IBAction)clicked:(UIButton *)sender {
    AppDelegate* app=[UIApplication sharedApplication].delegate;
    switch (sender.tag) {
        case 0:
        {
            Person *p = [NSEntityDescription insertNewObjectForEntityForName:@"Person" inManagedObjectContext:app.managedObjectContext];
            p.name=@"张三";
            p.email=@"28025920@qq.com";
            p.age=29;
            p.number=@"18175922040";
            [app saveContext];
//            NSLog(@"name:%@ email:%@ age:%d number:%@",p.name,p.email,p.age,p.number);
        }
            break;
        case 1:
            //删
        {
            NSFetchRequest* fetR=[[NSFetchRequest alloc]initWithEntityName:@"Person"];
            NSArray* persons=[app.managedObjectContext executeFetchRequest:fetR error:nil];
            for (Person* p in persons) {
                if ([p.name isEqualToString:@"王五"]) {
                    [app.managedObjectContext deleteObject:p];
                }
            }
        }
            break;
        case 2:
            //改
        {
            NSFetchRequest* fetR=[[NSFetchRequest alloc]initWithEntityName:@"Person"];
            NSArray* persons=[app.managedObjectContext executeFetchRequest:fetR error:nil];
            for (Person* p in persons) {
                if ([p.name isEqualToString:@"张三"]) {
                    p.name=@"王五";
                    [app saveContext];
                }
            }
        }
            break;
        case 3:
        {
            NSFetchRequest* fetR=[[NSFetchRequest alloc]initWithEntityName:@"Person"];
            NSArray* persons=[app.managedObjectContext executeFetchRequest:fetR error:nil];
            for (Person* p in persons) {
                NSLog(@"name:%@ email:%@ age:%d number:%@",p.name,p.email,p.age,p.number);
            }
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
