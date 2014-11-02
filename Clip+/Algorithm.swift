//
//  Algorithm.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/30.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import UIKit
import Foundation
//#define COMMON_DIGEST_FOR_OPENSSL

/*
extension String {
    func md5Encrypt()->String{
        var ns = NSString(self);
        var utf8i  = ns.UTF8String
        var utf8s = self.fromCString(cs:utf8i)
        let original_strlen = original_str.count;
        var result :[UInt8] = [UInt8]();
        
        CC_MD5(original_str, CC_LONG(original_strlen), result);
        var hash:String = "";  
        for (var i:Int = 0; i < 16; i = i+1)  {
            let str = "\(result[i])";
            hash += str;
        }
        return hash.uppercaseString;  
    }
}*/
func md5(str:NSString)->String{
    var ss = str.cStringUsingEncoding(NSUTF8StringEncoding);
    var kdata = NSData(bytes: ss,length:str.length);
    var out:[UInt8] = [UInt8](count:16,repeatedValue:0)
    //CC_MD5(kdata,len:CC_LONG(str.length),md:out);
    return "";
}