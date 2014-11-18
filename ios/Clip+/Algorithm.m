//
//  Algorithm.m
//  Algorithm
//
//  Created by 张宏台 on 14/11/3.
//  Copyright (c) 2014年 张宏台. All rights reserved.
//

#import "Algorithm.h"

//@implementation Algorithm

//@end

#import <CommonCrypto/CommonCryptor.h>
#import <CommonCrypto/CommonDigest.h>
//#import "algorithm.h"
#import "GTMBase64/GTMBase64.h"



@implementation NSString (Encryption)

- (NSString *)AES256EncryptWithKey:(NSString *)key {//加密
    
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    char keyPtr[kCCKeySizeAES128+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesEncrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCEncrypt, kCCAlgorithmAES,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesEncrypted);
    if (cryptStatus == kCCSuccess) {
        //待加64编码
        NSData *data =  [NSData dataWithBytesNoCopy:buffer length:numBytesEncrypted];
        NSString *str = [data encodeBase64Data];
        return str;
    }
    free(buffer);
    return nil;
}


- (NSString *)AES256DecryptWithKey:(NSString *)key {//解密
    NSData *data = [self dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    
    char keyPtr[kCCKeySizeAES256+1];
    bzero(keyPtr, sizeof(keyPtr));
    [key getCString:keyPtr maxLength:sizeof(keyPtr) encoding:NSUTF8StringEncoding];
    //待加64解码
    data = [GTMBase64 decodeData:data];
    NSUInteger dataLength = [data length];
    size_t bufferSize = dataLength + kCCBlockSizeAES128;
    void *buffer = malloc(bufferSize);
    size_t numBytesDecrypted = 0;
    CCCryptorStatus cryptStatus = CCCrypt(kCCDecrypt, kCCAlgorithmAES128,
                                          kCCOptionPKCS7Padding | kCCOptionECBMode,
                                          keyPtr, kCCBlockSizeAES128,
                                          NULL,
                                          [data bytes], dataLength,
                                          buffer, bufferSize,
                                          &numBytesDecrypted);
    if (cryptStatus == kCCSuccess) {
        NSData *data = [NSData dataWithBytesNoCopy:buffer length:numBytesDecrypted];
        NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        return str;
    }
    free(buffer);
    return nil;
}


@end


// #pragma mark - base64
//
// + (NSString*)encodeBase64String:(NSString * )input {
//     NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//     data = [GTMBase64 encodeData:data];
//     NSString *base64String = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//     return base64String;
// }
//
// + (NSString*)decodeBase64String:(NSString * )input {
//     NSData *data = [input dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
//     data = [GTMBase64 decodeData:data];
//     NSString *base64String = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//     return base64String;
// }
//
@implementation NSData (Base64)
- (NSString*)encodeBase64Data {
    NSData *data = [GTMBase64 encodeData:self];
    NSString *base64String = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];    return base64String;
}
@end
//
// + (NSString*)decodeBase64Data:(NSData *)data {
//     data = [GTMBase64 decodeData:data];
//     NSString *base64String = [[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding] autorelease];
//     return base64String;
// }
// + (NSData*)encodeBase64:(NSData *)data {
//     data = [GTMBase64 encodeData:data];
//     return data;
// }
//
// + (NSData*)decodeBase64:(NSData *)data {
//     data = [GTMBase64 decodeData:data];
//     return data;
// }



@implementation NSString (MD5)

- (NSString *)md5Encrypt {
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++)
        [hash appendFormat:@"%02X", result[i]];
    NSString *str1=[hash substringWithRange:NSMakeRange(3, 16)];
    return [str1 uppercaseString];
}  

@end