//
//  ViewController.m
//  Game1
//
//  Created by Pierre Chesnot on 2/10/16.
//  Copyright © 2016 Pierre Chesnot. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    
    HighScoreNumberForView = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    HighScore.text = [NSString stringWithFormat:@"High Score: %li", (long)HighScoreNumberForView];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
