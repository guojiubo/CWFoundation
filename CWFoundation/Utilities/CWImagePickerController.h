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

// UIImagePickerController will break status bar's appearence
// Set the block to restore it, this block will be executed in viewWillAppear
@property (nonatomic, copy) void (^restoreStatusBarBlock) (void);

@property (nonatomic, strong, readonly) UIImage *orignalImage;
@property (nonatomic, strong, readonly) UIImage *editedImage;

@property (nonatomic, strong, readonly) UIImage *fullResolutionImage;
@property (nonatomic, strong, readonly) UIImage *fullScreenImage;

// Determine whether auto dimiss view controller after finish or cancel picking image, defaults to NO
@property (nonatomic, assign) BOOL autoDismiss;

@end
