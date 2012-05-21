//
//  GestureRecognizersViewController.m
//  Gestures
//
//  Created by Ariel Elkin on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "GestureRecognizers.h"

@interface GestureRecognizers ()

@end

@implementation GestureRecognizers
@synthesize positionLabel;
@synthesize handImage;


-(void)viewDidAppear:(BOOL)animated{
    NSLog(@"\n\nON GESTURES VIEW\n\n");
    positionLabel.text = @"Gesture around...";
    handImage.transform = CGAffineTransformIdentity;
}

-(void)initGestureRecognizers{
    
    //init Pan Gesture Recognizer
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]
                                          initWithTarget:self action:@selector(handlePanGesture:)];
    [self.view addGestureRecognizer:panGesture];
    
    //init Rotation Gesture Recognizer
    UIRotationGestureRecognizer *rotationGesture = [[UIRotationGestureRecognizer alloc]
                                                    initWithTarget:self action:@selector(handleRotationGesture:)];
    [self.view addGestureRecognizer:rotationGesture];
    
    //init Pinch Gesture Recognizer
    UIPinchGestureRecognizer *pinchGesture = [[UIPinchGestureRecognizer alloc]
                                              initWithTarget:self action:@selector(handlePinchGesture:)];
    [self.view addGestureRecognizer:pinchGesture];

}

/*******************************************************************
 UIPanGestureRecognizer: if you want to know the speed and amount of
 a panning/dragging gesture, using this instead of touchesMoved 
 will involve less maths.
 */

- (IBAction)handlePanGesture:(UIPanGestureRecognizer *)sender {

    CGPoint translatedPoint = [(UIPanGestureRecognizer*)sender translationInView:self.view];

    positionLabel.text = [NSString stringWithFormat:@"PAN GESTURE\nTranslated point: %0.0f, %0.0f", translatedPoint.x, translatedPoint.y];
    NSLog(@"PAN GESTURE: Translated point: %0.0f, %0.0f", translatedPoint.x, translatedPoint.y);
    
    handImage.transform = CGAffineTransformMakeTranslation(translatedPoint.x, translatedPoint.y);
    
    if(sender.state == UIGestureRecognizerStateEnded){
        positionLabel.text = @"PAN ENDED";
        NSLog(@"PAN ENDED\n\n");
    }
}

/*******************************************************************
 UIRotationGestureRecognizer: Use this to recognize rotation 
 gestures.
 
 Note rotation is in radians (1 radian = 57.3 degrees, pi radians = 180 degrees)
 */
-(IBAction)handleRotationGesture:(UIGestureRecognizer *) sender{
    CGFloat rotation = [(UIRotationGestureRecognizer *) sender rotation]; 
    CGFloat velocity = [(UIRotationGestureRecognizer *) sender velocity];
    
    positionLabel.text = [NSString stringWithFormat:@"ROTATION GESTURE\nRotation: %f, velocity: %f", rotation, velocity];
    NSLog(@"ROTATION GESTURE: Rotation: %f, velocity: %f", rotation, velocity);
    
    CGAffineTransform t = handImage.transform;
    handImage.transform = CGAffineTransformRotate(t, rotation);
    
    if(sender.state == UIGestureRecognizerStateEnded){
        positionLabel.text = @"ROTATION ENDED";
        NSLog(@"ROTATION ENDED\n\n");
    }
}

/*******************************************************************
 UIPinchGestureRecognizer: Use this to recognize pinches.
 
 */
- (IBAction)handlePinchGesture:(UIGestureRecognizer *)sender {
    CGFloat scale = [(UIPinchGestureRecognizer *)sender scale];
    CGFloat velocity = [(UIPinchGestureRecognizer *)sender velocity];
    
    handImage.transform = CGAffineTransformMakeScale(scale, scale);
    
    positionLabel.text = [NSString stringWithFormat:@"PINCH GESTURE\nScale: %f, Velocity: %f", scale, velocity];
    NSLog(@"PINCH GESTURE: Scale: %f, Velocity: %f", scale, velocity);
    
    if(sender.state == UIGestureRecognizerStateEnded){
        positionLabel.text = @"PINCH ENDED";
        NSLog(@"PINCH ENDED\n\n");
    }
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initGestureRecognizers];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}


@end
