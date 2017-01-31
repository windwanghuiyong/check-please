//
//  ViewController.m
//  CheckPlease
//
//  Created by wanghuiyong on 31/01/2017.
//  Copyright © 2017 Personal Organization. All rights reserved.
//

#import "ViewController.h"
#import "CheckMarkRecoginzer.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CheckMarkRecoginzer *check = [[CheckMarkRecoginzer alloc] initWithTarget:self action:@selector(doCheck:)];
    [self.view addGestureRecognizer:check];
    self.imageView.hidden = YES;
}

- (void)doCheck:(CheckMarkRecoginzer *)check {
    self.imageView.hidden = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 2 * NSEC_PER_SEC), dispatch_get_main_queue(), ^{self.imageView.hidden = YES;});
}

@end
