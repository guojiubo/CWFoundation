//
//  CWAlertView.m
//  CWFoundation
//
//  Created by Guojiubo on 14-8-30.
//  Copyright (c) 2014年 CocoaWind. All rights reserved.
//

#import "CWAlertView.h"

@interface CWAlertView () <UIAlertViewDelegate>

@end

@implementation CWAlertView
{
	NSMutableDictionary *_actionsPerIndex;
    
	CWAlertViewBlock _cancelBlock;
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

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message
{
    return [self initWithTitle:title message:message delegate:nil cancelButtonTitle:nil otherButtonTitles:nil];
}

- (id)initWithTitle:(NSString *)title message:(NSString *)message delegate:(id)delegate cancelButtonTitle:(NSString *)cancelButtonTitle otherButtonTitles:(NSString *)otherButtonTitles, ...
{
	self = [self init];
	if (self) {
        self.title = title;
        self.message = message;
        
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
        if (cancelButtonTitle) {
            [self addCancelButtonWithTitle:cancelButtonTitle block:nil];
        }
        
        _externalDelegate = delegate;
	}
	return self;
}

- (NSInteger)addButtonWithTitle:(NSString *)title block:(CWAlertViewBlock)block
{
	NSInteger retIndex = [self addButtonWithTitle:title];
    
	if (block) {
		NSNumber *key = [NSNumber numberWithInteger:retIndex];
		[_actionsPerIndex setObject:[block copy] forKey:key];
	}
    
	return retIndex;
}

- (NSInteger)addCancelButtonWithTitle:(NSString *)title block:(CWAlertViewBlock)block
{
	NSInteger retIndex = [self addButtonWithTitle:title block:block];
	[self setCancelButtonIndex:retIndex];
    
	return retIndex;
}

- (void)setCancelBlock:(CWAlertViewBlock)block
{
	_cancelBlock = block;
}

# pragma mark - UIAlertViewDelegate

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSNumber *key = [NSNumber numberWithInteger:buttonIndex];
    
	CWAlertViewBlock block = [_actionsPerIndex objectForKey:key];
	if (block) {
		block();
	}
    
	if ([self.externalDelegate respondsToSelector:@selector(alertView:clickedButtonAtIndex:)]) {
		[self.externalDelegate alertView:self clickedButtonAtIndex:buttonIndex];
	}
}

- (void)alertViewCancel:(UIAlertView *)alertView
{
	if (_cancelBlock) {
		_cancelBlock();
	}
    
	if ([self.externalDelegate respondsToSelector:@selector(alertViewCancel:)]) {
		[self.externalDelegate alertViewCancel:self];
	}
}

- (void)willPresentAlertView:(UIAlertView *)alertView
{
	if ([self.externalDelegate respondsToSelector:@selector(willPresentAlertView:)]) {
		[self.externalDelegate willPresentAlertView:self];
	}
}

- (void)didPresentAlertView:(UIAlertView *)alertView
{
	if ([self.externalDelegate respondsToSelector:@selector(didPresentAlertView:)]) {
		[self.externalDelegate didPresentAlertView:self];
	}
}

- (void)alertView:(UIAlertView *)alertView willDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ([self.externalDelegate respondsToSelector:@selector(alertView:willDismissWithButtonIndex:)]) {
		[self.externalDelegate alertView:self willDismissWithButtonIndex:buttonIndex];
	}
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
	if ([self.externalDelegate respondsToSelector:@selector(alertView:didDismissWithButtonIndex:)]) {
		[self.externalDelegate alertView:self didDismissWithButtonIndex:buttonIndex];
	}
}

- (BOOL)alertViewShouldEnableFirstOtherButton:(UIAlertView *)alertView
{
	if ([self.externalDelegate respondsToSelector:@selector(alertViewShouldEnableFirstOtherButton:)]) {
		return [self.externalDelegate alertViewShouldEnableFirstOtherButton:self];
	}
    
	return YES;
}

#pragma mark - Properties 

- (void)setDelegate:(id <UIAlertViewDelegate>)delegate
{
    if (!delegate) {
        return;
    }
    
    [NSException raise:@"CWFoundationException" format:@"Don't set delegate, set externalDelegate instead."];
}

@end
