//
//  Game.h
//  Game1
//
//  Created by Pierre Chesnot on 2/10/16.
//  Copyright © 2016 Pierre Chesnot. All rights reserved.
//

#import <UIKit/UIKit.h>

int BirdFlight;  //Integer to tell how to move bird
int RandomTopTunnelPosition;
int RandomBottomTunnelPosition;
int ScoreNumber;
NSInteger HighScoreNumber;

@interface Game : UIViewController

{
    
    IBOutlet UIImageView *Bird;
    IBOutlet UIButton *StartGame;
    IBOutlet UIImageView *TunnelTop;
    IBOutlet UIImageView *TunnelBottom;
    IBOutlet UIImageView *Top;
    IBOutlet UIImageView *Bottom;
    IBOutlet UIButton *Exit;
    IBOutlet UILabel *ScoreLabel;
    
    NSTimer *BirdMovement;   //Timer to make bird move
    NSTimer *TunnelMovement;
    
}

-(IBAction)StartGame:(id)sender;
-(void)BirdMoving;           //Method to hold code to make bird move up or down
-(void)TunnelMoving;
-(void)PlaceTunnels;
-(void)Score;
-(void)GameOver;

@end
