//
//  Algorithm.h
//  Algorithm
//
//  Created by 张宏台 on 14/11/3.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

#import <Foundation/Foundation.h>

//@interface Algorithm : NSObject

@interface NSString (Encryption)

- (NSString *)AES256EncryptWithKey:(NSString *)key;   //加密
- (NSString *)AES256DecryptWithKey:(NSString *)key;   //解密


@end

@interface NSData (Base64)
 - (NSString*)encodeBase64Data;
@end

@interface NSString (MD5)

- (NSString *)md5Encrypt;

@end

