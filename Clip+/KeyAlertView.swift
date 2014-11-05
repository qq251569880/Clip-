//
//  KeyAlertView.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/31.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import Foundation
import UIKit

class KeyAlertViewController: UIAlertView {
    
    weak keyInput:UITextField = nil;
    
    func initWithTitle(title:SString,message:NSString,del:delegate,cancelButtonTitle:NSString,otherButtonTitles:NSString,...) ->UIAlertView {
        
        //self = super.initWithTitle(title,message:message,delegate:del,cancelButtonTitle:cancelButtonTitle,otherButtonTitles:otherButtonTitles,nil);
    
        if (self != nil){
            self.keyInput = createTextField("请输入密钥",frame:CGRectMake(22, 45, 240, 36));
            self.addSubview(self.Input!);

        }
    }
    
    func layoutSubviews(){
        super.layoutSubviews();

        for ( view in self.subviews) {
            // 搜索AlertView底部的按钮，然后将其位置下移
            // IOS5以前按钮类是UIButton, IOS5里该按钮类是UIThreePartButton
            if (view.isKindOfClass(UIButton) || view.isKindOfClass(NSClassFromString(@"UIThreePartButton"))) {
                var btnBounds:CGRect  = view.frame;
                btnBounds.origin.y = self._cfmPwd.frame.origin.y + self._cfmPwd.frame.size.height + 7;
                view.frame = btnBounds;
            }
        }
    
        // 定义AlertView的大小
        var bounds:CGRect  = self.frame;
        bounds.size.height = 260;
        self.frame = bounds;
    }

    func createTextField(placeholder:NSString ,frame:CGRect)->UITextField {
        var  field:UITextField = UITextField(frame:frame);
        field.placeholder = placeholder;
        field.secureTextEntry = YES;
        field.backgroundColor = UIColor.whiteColor; 
        field.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;

        return field;
    }
}

