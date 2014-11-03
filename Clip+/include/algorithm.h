//
//  algorithm.h
//  Clip+
//
//  Created by 张宏台 on 14/10/31.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

#ifndef Clip__cryptolib_h
#define Clip__cryptolib_h

@interface AlgorithmLib : NSObject

- (NSData *)AES256EncryptWithKey:(NSString *)key;   //加密  
- (NSData *)AES256DecryptWithKey:(NSString *)key;   //解密

#pragma mark - base64 
+ (NSString*)encodeBase64String:(NSString *)input;  
+ (NSString*)decodeBase64String:(NSString *)input;  
+ (NSString*)encodeBase64Data:(NSData *)data;  
+ (NSString*)decodeBase64Data:(NSData *)data; 


@end


@interface NSString (MD5)  

- (NSString *)md5Encrypt;  

@end 

#endif
