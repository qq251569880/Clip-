//
// Public.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/30.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//
import Foundation
import UIKit

//默认密钥
let defaultKey="f_sa^j34@sajf#!214=-f-dsf9=-241";
//密钥明文，全局使用
var passWd:NSString = defaultKey;
//MD5加密后的密钥，全局使用
var keyString:String = "";

let tipString="点击以查看明文www.datappp.com";

//主页菜单显示
struct MainMenuInfo{
    var menuId:Int
    var menuDisplay:String
    var menuDiscription:String
}

var GmenuArray:[MainMenuInfo] = [];

func initRoomClassifyArray(){

    GmenuArray = []
    var menuName = "使用帮助"
    var menuTip = "功能介绍，使用场景，以及如何使用"
    var menu = MainMenuInfo(menuId:1, menuDisplay:menuName,menuDiscription:menuTip)
    GmenuArray.append(menu)
    
    menu.menuId = 2
    menu.menuDisplay = "设置密钥"
    menu.menuDiscription = "设置用于加密的密钥"
    GmenuArray.append(menu)
    
    menu.menuId = 3
    menu.menuDisplay = "捐助"
    menu.menuDiscription = "看这里~看这里~"
    GmenuArray.append(menu)
    
    menu.menuId = 4
    menu.menuDisplay = "隐藏"
    menu.menuDiscription = "隐藏主页面，使用复制剪切、粘贴加解密"
    GmenuArray.append(menu)
    
    menu.menuId = 5
    menu.menuDisplay = "关于"
    menu.menuDiscription = "关于Clip+关于Data+++关于我们"
    GmenuArray.append(menu)
    
    menu.menuId = 6
    menu.menuDisplay = "退出"
    menu.menuDiscription = "完全退出应用"
    GmenuArray.append(menu)
   

}

func trimSpace(inStr:String) -> outStr:String {
    let index = advance(s.startIndex, 1);//去首字符
    let index2 = advance(s.endIndex, -1);//去末字符
    var tmpStr:String = inStr;
    while(tmpStr.hasPrefix(" ")){
        tmpStr = tmpStr.substringFromIndex(index); 
    }
    while(tmpStr.hasSuffix(" ")||tmpStr.hasSuffix("\n")||tmpStr.hasSuffix("\r")){
        tmpStr = tmpStr.substringToIndex(index2);
    }

    if(tmpStr.hasSuffix(tipString)){
        let indexTip = advance(s.endIndex,-tipString.length);
        println("before trim:\(tmpStr)");
        tmpStr = tmpStr.substringToIndex(indexTip);
        println("after  trim:\(tmpStr)");
    }
    return tmpStr;
}

func switchFormat(inStr:String) -> outStr:String? {
    var retStr:String? = nil;
    if(inStr.hasPrefix("[") && inStr.hasSuffix("]")){
        let index = advance(s.startIndex, 1);//去首字符
        let index2 = advance(s.endIndex, -1);//去末字符
        var tmpStr = inStr;
        tmpStr = tmpStr.substringFromIndex(index); 
        tmpStr = tmpStr.substringToIndex(index2);
        var content:NSString = inStr;
        var retNStr  = content.AES256DecryptWithKey(keyString);
        println("decode str \(retNStr)"); 
        if retNstr != nil{
            retStr = retNStr;
        }

    }else{
        var content:NSString = inStr;
        var retNStr  = content.AES256EncryptWithKey(keyString);
        println("encode str \(retNStr)"); 
        if retNstr != nil{
            retStr = retNStr;
            retStr = "["+retStr+"]"+tipString;
        }

    }
    return retStr;
}