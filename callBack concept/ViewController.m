//
//  ViewController.m
//  callBack concept
//
//  Created by Peter Yo on 8月/5/16.
//  Copyright © 2016年 Peter Hsu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic) NSMutableArray *handlers;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.handlers = [NSMutableArray  new];
    [self.handlers addObject:^(){
        NSLog(@"methodDD");
        NSLog(@"methodEE");
    }];
    [self.handlers addObject:^(){
        NSLog(@"methodFF");
    }];
    
    [self methodDefault];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) methodDefault {
    [self methodA];
}

- (void) methodA {
    NSLog(@"methodA");
    if(self.handlers.count != 0){
        for (int i = 0; i < self.handlers.count ;i++) {
            void(^handle)() = [self.handlers objectAtIndex:i];
            handle();
        }
        
    }
    [self methodB];
}

- (void) methodB {
    NSLog(@"methodB");
    [self methodC];
}

- (void) methodC {
    NSLog(@"methodC");
}


@end













