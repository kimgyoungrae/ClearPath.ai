#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "common.h"
#import "c_api.h"
#import "ios_image_load.h"
#import "TensorFlowLiteC.h"
#import "TflitePlugin.h"
#import "xnnpack_delegate.h"

FOUNDATION_EXPORT double flutter_tfliteVersionNumber;
FOUNDATION_EXPORT const unsigned char flutter_tfliteVersionString[];

