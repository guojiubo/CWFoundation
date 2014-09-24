//
//  CWActionSheet.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "CWActionSheet.h"

@interface CWActionSheet () <UIActionSheetDelegate>

@end

@implementation CWActionSheet
{
	NSMutableDictionary *_actionsPerIndex;
}

- (id)init
{
    self = [super init];
    if (self) {
        _actionsPerIndex = [[NSMutableDictionary alloc] init];
        [super setDelegate:self];
    }
    return self;
}

- (instancetype)initWithTitle:(NSString *)title
{
    return [self initWithTitle:title delegate:nil cancelButtonTitle:nil destructiveButtonTitle:nil otherButtonTitles:nil];
}

- (id)initWithTitle:(NSString *)title delegate:(id<UIActionSheetDelegate>)delegate cancelButtonTitle:(NSString *)cancelButtonTitle destructiveButtonTitle:(NSString *)destructiveButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
	self = [self init];
	if (self) {
        self.title = title;
        
        if (otherButtonTitles != nil) {
            [self addButtonWithTitle:otherButtonTitles];
            va_list args;
            va_start(args, otherButtonTitles);
            NSString *title = nil;
            while( (title = va_arg(args, NSString *)) ) {
                [self addButtonWithTitle:title];
            }
            va_end(args);
        }
        
        if (destructiveButtonTitle) {
            [self addDestructiveButtonWithTitle:destructiveButtonTitle block:nil];
        }
        if (cancelButtonTitle) {
            [self addCancelButtonWithTitle:cancelButtonTitle block:nil];
        }
        
        _externalDelegate = delegate;
	}
	
	return self;
}

- (NSInteger)addButtonWithTitle:(NSString *)title block:(CWActionSheetBlock)block
{
	NSInteger retIndex = [self addButtonWithTitle:title];
	
	if (block) {
		NSNumber *key = [NSNumber numberWithInteger:retIndex];
		[_actionsPerIndex setObject:[block copy] forKey:key];
	}
	
	return retIndex;
}

- (NSInteger)addDestructiveButtonWithTitle:(NSString *)title block:(CWActionSheetBlock)block
{
	NSInteger retIndex = [self addButtonWithTitle:title block:block];
	[self setDestructiveButtonIndex:retIndex];
	
	return retIndex;
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title
{
    return [self addCancelButtonWithTitle:title block:nil];
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(CWActionSheetBlock)block
{
	NSInteger retIndex = [self addButtonWithTitle:title block:block];
	[self setCancelButtonIndex:retIndex];
	
	return retIndex;
}

#pragma mark - UIActionSheetDelegate (forwarded)

- (void)actionSheetCancel:(UIActionSheet *)actionSheet
{
	if ([self.externalDelegate respondsToSelector:@selector(actionSheetCancel:)]) {
		[self.externalDelegate actionSheetCancel:actionSheet];
	}
}

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
	if ([self.externalDelegate respondsToSelector:@selector(willPresentActionSheet:)]) {
		[self.externalDelegate willPresentActionSheet:actionSheet];
	}
}

- (void)didPresentActionSheet:(UIActionSheet *)actionSheet
{
	if ([self.externalDelegate respondsToSelector:@selector(didPresentActionSheet:)]) {
		[self.externalDelegate didPresentActionSheet:actionSheet];
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ([self.externalDelegate respondsToSelector:@selector(actionSheet:willDismissWithButtonIndex:)]) {
		[self.externalDelegate actionSheet:actionSheet willDismissWithButtonIndex:buttonIndex];
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    if ([self.externalDelegate respondsToSelector:@selector(actionSheet:didDismissWithButtonIndex:)]) {
		[self.externalDelegate actionSheet:actionSheet didDismissWithButtonIndex:buttonIndex];
	}
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
	NSNumber *key = [NSNumber numberWithInteger:buttonIndex];
	
	CWActionSheetBlock block = [_actionsPerIndex objectForKey:key];
	
	if (block) {
		block();
	}
    
    if ([self.externalDelegate respondsToSelector:@selector(actionSheet:clickedButtonAtIndex:)]) {
        [self.externalDelegate actionSheet:actionSheet clickedButtonAtIndex:buttonIndex];
    }
}

#pragma mark - Properties

- (void)setDelegate:(id <UIAlertViewDelegate>)delegate
{
    [NSException raise:@"CWFoundationException" format:@"Don't set delegate, set externalDelegate instead."];
}

@end
