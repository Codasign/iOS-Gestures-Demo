//
//  ViewController.m
//  Gestures
//
//  Created by Ariel Elkin on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleTouchRecognizers.h"

@interface SimpleTouchRecognizers ()
@property (strong) IBOutlet UILabel *positionLabel;
@end

@implementation SimpleTouchRecognizers
@synthesize positionLabel;


-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"\n\nON TOUCHES VIEW\n\n");
    positionLabel.text = @"Touch around...";
}

/*******************************************************************
 touchesBegan gets called when touches begin on the view.
 */
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    //Get the touch object:
    UITouch *touch = [[event allTouches] anyObject];

    //Get the touches' coordinates:
    CGPoint touchDown = [touch locationInView:self.view];

    //Print it:
    NSLog(@"TOUCH DOWN x: %0.0f, y: %0.0f", touchDown.x, touchDown.y);
    
    positionLabel.text = [NSString stringWithFormat:@"TOUCH DOWN\nx: %0.0f, y: %0.0f", touchDown.x, touchDown.y];

}

/*******************************************************************
 touchesMoved gets called every time touches move around the view.
 */
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchMoving = [touch locationInView:self.view];

    NSLog(@"TOUCHES MOVED, x: %0.0f, y: %0.0f", touchMoving.x, touchMoving.y);
    
    positionLabel.text = [NSString stringWithFormat:@"TOUCHES MOVED\nx: %0.0f, y: %0.0f", touchMoving.x, touchMoving.y];

}

/*******************************************************************
 touchesEnded gets called when the finger has been removed from the view.
 */
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint touchUp = [touch locationInView:self.view];
    
    NSLog(@"TOUCH UP, x: %0.0f, y: %0.0f", touchUp.x, touchUp.y);
    
    positionLabel.text = [NSString stringWithFormat:@"TOUCH UP\nx: %0.0f, y: %0.0f", touchUp.x, touchUp.y];
}


@end
