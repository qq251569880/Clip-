//
//  Algorithm.swift
//  Clip+
//
//  Created by 张宏台 on 14/10/30.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

import UIKit

#define COMMON_DIGEST_FOR_OPENSSL
#import <CommonCrypto/CommonDigest.h>  

extension String {
    func md5Encrypt()->String{
        let original_str:[char] = self.utf8;  
        let original_strlen = original_str.size();
        let result = [unsigned char](count:CC_MD5_DIGEST_LENGTH,repeatValue:0);
        
        CC_MD5(original_str, original_strlen, result);  
        var hash:String = "";  
        for (int i = 0; i < 16; i++)  {
            let str = "\(result[i].hex)";
            hash.append(str);
        }
        return hash.uppercaseString;  
    }
}