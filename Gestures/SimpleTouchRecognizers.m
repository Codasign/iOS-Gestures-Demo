//
//  ViewController.m
//  Gestures
//
//  Created by Ariel Elkin on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "SimpleTouchRecognizers.h"

@interface SimpleTouchRecognizers ()

@end

@implementation SimpleTouchRecognizers
@synthesize positionLabel;

CGPoint touchDown;
CGPoint touchUp;
CGPoint touchMoving;

-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"\n\nON TOUCHES VIEW\n\n");
    positionLabel.text = @"Touch around...";
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    touchDown = [touch locationInView:self.view];

    positionLabel.text = [NSString stringWithFormat:@"TOUCH DOWN\nx: %0.0f, y: %0.0f", touchDown.x, touchDown.y];
    NSLog(@"TOUCH DOWN x: %0.0f, y: %0.0f", touchDown.x, touchDown.y);
}

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    touchMoving = [touch locationInView:self.view];
    positionLabel.text = [NSString stringWithFormat:@"TOUCHES MOVED\nx: %0.0f, y: %0.0f", touchMoving.x, touchMoving.y];
    NSLog(@"TOUCHES MOVED, x: %0.0f, y: %0.0f", touchMoving.x, touchMoving.y);
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [[event allTouches] anyObject];
    touchUp = [touch locationInView:self.view];
    positionLabel.text = [NSString stringWithFormat:@"TOUCH UP\nx: %0.0f, y: %0.0f", touchUp.x, touchUp.y];
    NSLog(@"TOUCH UP, x: %0.0f, y: %0.0f", touchUp.x, touchUp.y);
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


@end
