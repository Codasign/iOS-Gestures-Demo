//
//  GestureRecognizersViewController.h
//  Gestures
//
//  Created by Ariel Elkin on 15/05/2012.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GestureRecognizers : UIViewController{
    
    IBOutlet UILabel *positionLabel;
    IBOutlet UIImageView *handImage;
    
}

@property (nonatomic) IBOutlet UILabel *positionLabel;
@property (nonatomic) IBOutlet UIImageView *handImage;

@end
