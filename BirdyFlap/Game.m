//
//  Game.m
//  Game1
//
//  Created by Pierre Chesnot on 2/10/16.
//  Copyright © 2016 Pierre Chesnot. All rights reserved.
//

#import "Game.h"

@interface Game ()

@end

@implementation Game

-(void)GameOver{
    
    if (ScoreNumber > HighScoreNumber){
        [[NSUserDefaults standardUserDefaults] setInteger:ScoreNumber forKey:@"HighScoreSaved"];
    }
    
    [TunnelMovement invalidate];
    [BirdMovement invalidate];
    
    Exit.hidden = NO;
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    Bird.hidden = YES;
    
}


-(void)Score{
    ScoreNumber = ScoreNumber + 1;
        ScoreLabel.text = [NSString stringWithFormat:@"%i", ScoreNumber];
}


//What happens when you hit Start Game button
//need the text to disappear and the bird to start moving according to timer. run timer every 0.05 seconds because this will give impression the bird is movign smoothly.
-(IBAction)StartGame:(id)sender{
    
    StartGame.hidden = YES;
    
    TunnelBottom.hidden = NO;
    TunnelTop.hidden = NO;
    
    BirdMovement=[NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(BirdMoving) userInfo:nil repeats:YES];
    
    [self PlaceTunnels];
    
    TunnelMovement = [NSTimer scheduledTimerWithTimeInterval:0.005 target:self selector:@selector(TunnelMoving) userInfo:nil repeats:YES];
    
}

// Now have to code BirdFlight

//First open command for what happens anywhere you tap anywhere on the screen
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    BirdFlight = 20;
}

//Now have to define BirdMoving to define how the bird will move up and down. x coordinate stays put, and subtract from y coordinate whatever the value of birdflight is.
-(void)BirdMoving{
    
    Bird.center = CGPointMake(Bird.center.x, Bird.center.y-BirdFlight);
    
    BirdFlight = BirdFlight - 5;
    
    if(BirdFlight < -20) {
        BirdFlight = -20;
    }
    
}

-(void)PlaceTunnels{
    
    RandomTopTunnelPosition = -arc4random_uniform(480);  //started at 480
    RandomBottomTunnelPosition = RandomTopTunnelPosition + 650;
    
    TunnelTop.center = CGPointMake(380, RandomTopTunnelPosition);
    TunnelBottom.center = CGPointMake(380, RandomBottomTunnelPosition);
    
}

-(void)TunnelMoving{
    
    TunnelTop.center = CGPointMake(TunnelTop.center.x - 1, TunnelTop.center.y);
    TunnelBottom.center = CGPointMake(TunnelBottom.center.x - 1, TunnelBottom.center.y);
    
    if (TunnelTop.center.x < -70){
        [self PlaceTunnels];
    }
    
    if (TunnelBottom.center.x == -20){
        [self Score];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelTop.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, TunnelBottom.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Bottom.frame)){
        [self GameOver];
    }
    
    if (CGRectIntersectsRect(Bird.frame, Top.frame)){
        [self GameOver];
    }
    
}


- (void)viewDidLoad {
    
    TunnelTop.hidden = YES;
    TunnelBottom.hidden = YES;
    
    Exit.hidden = YES;
    ScoreNumber = 0;
    
    HighScoreNumber = [[NSUserDefaults standardUserDefaults] integerForKey:@"HighScoreSaved"];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
