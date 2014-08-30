//
//  FSImagePickerController.m
//  FutureStep
//
//  Created by guojiubo on 8/6/14.
//
//

#import "CWImagePickerController.h"
#import <AssetsLibrary/AssetsLibrary.h>

@interface CWImagePickerController () <UINavigationControllerDelegate, UIImagePickerControllerDelegate>

@property (nonatomic, strong) UIImage *orignalImage;
@property (nonatomic, strong) UIImage *editedImage;

@property (nonatomic, strong) UIImage *fullResolutionImage;
@property (nonatomic, strong) UIImage *fullScreenImage;

@end

@implementation CWImagePickerController

- (id)init
{
    self = [super init];
    if (self) {
        self.delegate = self;
    }
    return self;
}

#pragma mark - UIImagePicker Delegate

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    self.orignalImage = info[UIImagePickerControllerOriginalImage];
    self.editedImage = info[UIImagePickerControllerEditedImage];
    
    NSURL *assetURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    ALAssetsLibrary * assetLibrary = [[ALAssetsLibrary alloc] init];
    [assetLibrary assetForURL:assetURL resultBlock:^(ALAsset *asset) {
        if (asset) {
            self.fullScreenImage = [self fullScreenImageForAsset:asset];
            self.fullResolutionImage = [self fullResolutionImageForAsset:asset];
        }
        
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.finishedBlock) {
                self.finishedBlock(self, info);
            }
        }];
    } failureBlock:^(NSError *error) {
        [self dismissViewControllerAnimated:YES completion:^{
            if (self.finishedBlock) {
                self.finishedBlock(self, info);
            }
        }];
    }];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:^{
        if (self.cancelBlock) {
            self.cancelBlock(self);
        }
    }];
}

#pragma mark - ALAssets Helper Methods

- (UIImage *)fullScreenImageForAsset:(ALAsset*)asset
{
    CGImageRef image = [[asset defaultRepresentation] fullScreenImage];
    
    return [UIImage imageWithCGImage:image scale:1.0 orientation:UIImageOrientationUp];
}

- (UIImage *)fullResolutionImageForAsset:(ALAsset*)asset
{
    ALAssetRepresentation * representation = [asset defaultRepresentation];
    
    CGImageRef image = [representation fullResolutionImage];
    UIImageOrientation orientation = (UIImageOrientation)[representation orientation];
    CGFloat scale = [representation scale];
    
    return [UIImage imageWithCGImage:image scale:scale orientation:orientation];
}

@end
