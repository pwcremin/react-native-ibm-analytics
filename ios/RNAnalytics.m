//
//  RNTextToSpeech.m
//  RNBluemixBoilerplate
//
//  Created by Patrick cremin on 8/2/17.
//  Copyright © 2017 Facebook. All rights reserved.
//

#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(RNAnalytics, NSObject)

RCT_EXTERN_METHOD(initialize:(NSString *)appName apiKey:(NSString *)apiKey)

RCT_EXTERN_METHOD(setUserIdentity:(NSString *)userIdentity)

RCT_EXTERN_METHOD(disable)
RCT_EXTERN_METHOD(enable)

RCT_EXTERN_METHOD(logAnalytics: (NSDictionary *)eventObject)


RCT_EXTERN_METHOD(logFatal:(NSString *) message)
RCT_EXTERN_METHOD(logError:(NSString *) message)
RCT_EXTERN_METHOD(logWarn:(NSString *) message)
RCT_EXTERN_METHOD(logDebug:(NSString *) message)
RCT_EXTERN_METHOD(logInfo:(NSString *) message)

RCT_EXTERN_METHOD(logLocation)

RCT_EXTERN_METHOD(send: (RCTResponseSenderBlock)errorCallback)

@end
