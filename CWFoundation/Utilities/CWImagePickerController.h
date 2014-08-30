//
//  FSImagePickerController.h
//  FutureStep
//
//  Created by guojiubo on 8/6/14.
//
//

#import <UIKit/UIKit.h>

@interface CWImagePickerController : UIImagePickerController

@property (nonatomic, copy) void (^finishedBlock) (CWImagePickerController *imagePicker, NSDictionary *mediaInfo);
@property (nonatomic, copy) void (^cancelBlock) (CWImagePickerController *imagePicker);

@property (nonatomic, strong, readonly) UIImage *orignalImage;
@property (nonatomic, strong, readonly) UIImage *editedImage;

@property (nonatomic, strong, readonly) UIImage *fullResolutionImage;
@property (nonatomic, strong, readonly) UIImage *fullScreenImage;

@end
