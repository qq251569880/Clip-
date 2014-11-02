//
//  ViewController.m
//  test
//
//  Created by yons on 14-8-7.
//  Copyright (c) 2014年 yons. All rights reserved.
//

// 版权属于原作者
// http://code4app.com (cn) http://code4app.net (en)
// 发布代码于最专业的源码分享网站: Code4App.com

#import "ViewController.h"
#import "TableViewController.h"
#import "SecurityUtil.h"
#import "GTMBase64.h"

#define KEY @"ABCDEFGHIJKLMNOP" //key可修改

@interface ViewController ()
{
    UIButton *encryption;
    UIButton *decrypt;
    UITextField *content;
    
    UILabel *Before;
    UILabel *after;
    UILabel *key;
}

@end



@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
	
    content = [[UITextField alloc] initWithFrame:CGRectMake(20, 60, 280, 40)];
    content.backgroundColor = [UIColor whiteColor];
    [self setBorder:content.layer];
    content.placeholder = @" 请输入加密或解密的字符串";
   
    [self.view addSubview:content];
    
     encryption = [[UIButton alloc] initWithFrame:CGRectMake(60, 125,80, 40)];
    [encryption setTitle:@"加密" forState:UIControlStateNormal] ;
    encryption.backgroundColor = [UIColor blackColor];
    [encryption addTarget:self action:@selector(Encryption) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:encryption];
    
     decrypt = [[UIButton alloc] initWithFrame:CGRectMake(175, 125,80, 40)];
    [decrypt setTitle:@"解密" forState:UIControlStateNormal] ;
     decrypt.backgroundColor = [UIColor blackColor];
    [decrypt addTarget:self action:@selector(Decrypt) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:decrypt];
    
    key = [[UILabel alloc] initWithFrame:CGRectMake(20, 190, 290, 20)];
    Before = [[UILabel alloc] initWithFrame:CGRectMake(20, 220, 290, 40)];
    Before.lineBreakMode = YES;
    Before.numberOfLines = 0;
   
    after = [[UILabel alloc] initWithFrame:CGRectMake(20, 270, 280, 40)];
    after.lineBreakMode = YES;
    after.numberOfLines = 0;
    
    [key setFont:[UIFont fontWithName:@"Arial" size:14]];
    [Before setFont:[UIFont fontWithName:@"Arial" size:14]];
    [after setFont:[UIFont fontWithName:@"Arial" size:14]];
    
    [self.view addSubview:key];
    [self.view addSubview:Before];
    [self.view addSubview:after];
}

// 加边框
- (void) setBorder: (CALayer*) layer
{
    [layer setMasksToBounds:YES];
    [layer setCornerRadius:5.0]; //设置矩圆角半径
    [layer setBorderWidth:0.7];   //边框宽度
    [layer setBorderColor:[[UIColor lightGrayColor] CGColor]];
}

//加密
- (void) Encryption
{
    if ([content.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示！" message:@"亲，你还没有输入任何内容！" delegate:self cancelButtonTitle:@"确 定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSString *string = [SecurityUtil encryptAESData:content.text app_key:KEY];
        key.text = [NSString stringWithFormat:@"加密key：%@",KEY];
        Before.text = [NSString stringWithFormat:@"加密前：%@",content.text];
        after.text = [NSString stringWithFormat:@"加密后：%@",string];
        
        NSLog(@"string：%@", string);
    }
   
}

//解密
- (void) Decrypt
{
    if ([content.text isEqualToString:@""])
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"温馨提示！" message:@"亲，你还没有输入任何内容！" delegate:self cancelButtonTitle:@"确 定" otherButtonTitles:nil, nil];
        [alert show];
    }
    else
    {
        NSData *EncryptData = [GTMBase64 decodeString:content.text]; //解密前进行GTMBase64编码
        NSString * string = [SecurityUtil decryptAESData:EncryptData app_key:KEY];
        
        key.text = [NSString stringWithFormat:@"解密key：%@",KEY];
        Before.text = [NSString stringWithFormat:@"解密前：%@",content.text];
        
        if ([string isEqualToString:@""] | [string isEqualToString:nil]) {
            string = @"解密失败，亲，请输入加密后的字符串！";
        }
        after.text = [NSString stringWithFormat:@"解密后：%@",string];
        
        NSLog(@"string：%@", string);
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
