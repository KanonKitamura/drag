//
//  ViewController.m
//  drag
//
//  Created by kanon kitamura on 2015/01/29.
//  Copyright (c) 2015年 myname. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    blackview=[[UIView alloc]initWithFrame:CGRectMake(135,400,50,50)];
    
    blackview.backgroundColor=[UIColor blackColor]; //viewを黒色にするよ
    [self.view addSubview:blackview];
    
    //ドラッグジェスチャーをblackviewに登録するよ
    UIPanGestureRecognizer *pan=
    [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    [blackview addGestureRecognizer:pan];
    
    [self random];
    
}
-(void)random{
    number=arc4random_uniform(2);
    NSLog(@"%d",number);
    switch(number){
        case 0:
            [self makeyellow];
            break;
        case 1:
            [self makeblue];
            break;
    }
}


-(void)panAction2:(UIPanGestureRecognizer *)sender{
    CGPoint p =[sender translationInView:self.view];
    CGPoint movedPoint = CGPointMake(bluesomallView.center.x + p.x,bluesomallView.center.y+ p.y);
    bluesomallView.center=movedPoint;
    NSLog(@"◆座標%@を移動中です◆",NSStringFromCGPoint(movedPoint));
    
    //移動した距離の初期化をします>>これをしないと値が続きからになっちゃうよ！
    [sender setTranslation:CGPointZero inView:self.view];
    
    //ジェスチャー終えます
    if(sender.state==UIGestureRecognizerStateEnded){
        NSLog(@"◆移動が終わりました◆");
        
        if(CGRectContainsPoint(yellowView.frame, bluesomallView.center))
        {resultLabel.text=@"黄色と重なりました";
            [bluesomallView removeFromSuperview];
            [self performSelector:@selector(random)withObject:nil afterDelay:0.5];
            
        }else if(CGRectContainsPoint(blueView.frame, bluesomallView.center))
        {resultLabel.text=@"青色と重なりました";
            
            [bluesomallView removeFromSuperview];
            [self performSelector:@selector(random) withObject:nil afterDelay:0.5];
            [self plusScore];
        }else{
            resultLabel.text=@"重なってません";
        }
        
    }else{
        resultLabel.text=@"移動中";
    }
    
}

-(void)panAction:(UIPanGestureRecognizer *)sender{
    CGPoint p =[sender translationInView:self.view];
    CGPoint movedPoint = CGPointMake(yellowsmallView.center.x + p.x,yellowsmallView.center.y+ p.y);
    yellowsmallView.center=movedPoint;
    NSLog(@"◆座標%@を移動中です◆",NSStringFromCGPoint(movedPoint));
    
    //移動した距離の初期化をします>>これをしないと値が続きからになっちゃうよ！
    [sender setTranslation:CGPointZero inView:self.view];
    
    //ジェスチャー終えます
    if(sender.state==UIGestureRecognizerStateEnded){
        NSLog(@"◆移動が終わりました◆");
        
    if(CGRectContainsPoint(yellowView.frame, yellowsmallView.center))
    {resultLabel.text=@"黄色と重なりました";
        [yellowsmallView removeFromSuperview];
        [self performSelector:@selector(random)withObject:nil afterDelay:0.5];
        [self plusScore];
    }else if(CGRectContainsPoint(blueView.frame, yellowsmallView.center))
    {resultLabel.text=@"青色と重なりました";
        [yellowsmallView removeFromSuperview];
        [self performSelector:@selector(random)withObject:nil afterDelay:0.5];    }else{
        resultLabel.text=@"重なってません";
    }
    
    }else{
        resultLabel.text=@"移動中";
    }

}

-(void)plusScore{
    score=score+100;
    scorelabel.text=[NSString stringWithFormat:@"%d",score];
    }

-(void)makeyellow{
    
    yellowView=[[UIView alloc]initWithFrame:CGRectMake(135, 400, 50, 50)];
    yellowView.backgroundColor=[UIColor yellowColor];
    [self.view addSubview:yellowsmallView];
    
    //ドラッグジェスチャーをいれるよ！
    UIPanGestureRecognizer *pan=
    [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction:)];
    
    [yellowView addGestureRecognizer:pan];
    
}

-(void)makeblue{
    bluesomallView=[[UIView alloc]initWithFrame:CGRectMake(135, 400, 50, 50)];
    bluesomallView.backgroundColor=[UIColor blueColor];
    [self.view addSubview:bluesomallView];
    
    UIPanGestureRecognizer *pan2=
    [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panAction2:)];
    [bluesomallView addGestureRecognizer:pan2];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

    @end
