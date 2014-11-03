//
//  algorithm.h
//  Clip+
//
//  Created by 张宏台 on 14/10/31.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

#ifndef Clip__cryptolib_h
#define Clip__cryptolib_h

@interface NSString (Encryption) 

- (NSString *)AES256EncryptWithKey:(NSString *)key;   //加密  
- (NSString *)AES256DecryptWithKey:(NSString *)key;   //解密



@end
//#pragma mark - base64 
// + (NSString*)encodeBase64String:(NSString *)input;  
// + (NSString*)decodeBase64String:(NSString *)input;  
// + (NSString*)encodeBase64Data:(NSData *)data;  
// + (NSString*)decodeBase64Data:(NSData *)data; 
// + (NSData*)encodeBase64:(NSData *)data;  
// + (NSData*)decodeBase64:(NSData *)data; 


@interface NSString (MD5)  

- (NSString *)md5Encrypt;  

@end 

#endif
