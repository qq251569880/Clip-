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

func trimSpace(inStr:String)->String{
    var tmpStr:String = inStr;
    while(tmpStr.hasPrefix(" ")){
        let index = advance(tmpStr.startIndex, 1);//去首字符
        tmpStr = tmpStr.substringFromIndex(index);
    }
    while(tmpStr.hasSuffix(" ")||tmpStr.hasSuffix("\n")||tmpStr.hasSuffix("\r")){
        let index2 = advance(tmpStr.endIndex, -1);//去末字符
        tmpStr = tmpStr.substringToIndex(index2);
    }

    if(tmpStr.hasSuffix(tipString)){
        
        println(tipString.lengthOfBytesUsingEncoding(NSUTF8StringEncoding));
        println(countElements(tipString));
        
        let indexTip = advance(tmpStr.endIndex,-(countElements(tipString)));
        println("before trim:\(tmpStr)");
        tmpStr = tmpStr.substringToIndex(indexTip);
        println("after  trim:\(tmpStr)");
    }
    return tmpStr;
}

func switchFormat(inStr:String)->String?{
    var retStr:String? = nil;
    if(inStr.hasPrefix("[") && inStr.hasSuffix("]")){
        var tmpStr = inStr;
        let index = advance(tmpStr.startIndex, 1);//去首字符
        tmpStr = tmpStr.substringFromIndex(index);
        let index2 = advance(tmpStr.endIndex, -1);//去末字符
        tmpStr = tmpStr.substringToIndex(index2);
        retStr  = tmpStr.AES256DecryptWithKey(keyString);
        println("decode str \(retStr)");

    }else{
        retStr  = inStr.AES256EncryptWithKey(keyString);
        println("encode str \(retStr)");
        if retStr != nil{
            retStr = "["+retStr!+"]"+tipString;
        }

    }
    return retStr;
}