//
// Public.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/30.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//
import Foundation


//默认密钥
let defaultKey="f_sa^j34@sajf#!214=-f-dsf9=-241";
//密钥明文，全局使用
var passWd:NSString = defaultKey;
//MD5加密后的密钥，全局使用
var keyString:String = "";

let tipString="点击以查看明文www.datappp.com";

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
        var tmpStr:String = inStr;
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