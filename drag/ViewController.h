//
//  ViewController.h
//  drag
//
//  Created by kanon kitamura on 2015/01/29.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIGestureRecognizerDelegate>{
    
    IBOutlet UIView *yellowView;
    IBOutlet UIView *blueView;
    IBOutlet UILabel*resultLabel;
    
    UIView *blackview;
    UIView *yellowsmallView;
    UIView *bluesomallView;
    
    int number;
    int score;
    IBOutlet UILabel *scorelabel;
}

-(void)panAction:(UIPanGestureRecognizer *)sender;

-(void)makeyellow;
-(void)makeblue;
-(void)random;
-(void)plusScore;


@end

