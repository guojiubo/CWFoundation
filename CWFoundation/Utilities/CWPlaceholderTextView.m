//
//  CWPlaceholderTextView.m
//  CWPlaceholderTextView
//
//  Created by guojiubo on 9/1/14.
//  Copyright (c) 2014 CocoaWind. All rights reserved.
//

#import "CWPlaceholderTextView.h"

static NSString *const kPlaceholderKey = @"placeholder";
static NSString *const kFontKey = @"font";
static NSString *const kAttributedTextKey = @"attributedText";
static NSString *const kTextKey = @"text";

@interface CWPlaceholderTextView ()

@property (nonatomic, strong) UITextView *placeholderTextView;

@end

@implementation CWPlaceholderTextView

- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [self removeObserver:self forKeyPath:kPlaceholderKey];
    [self removeObserver:self forKeyPath:kFontKey];
    [self removeObserver:self forKeyPath:kAttributedTextKey];
    [self removeObserver:self forKeyPath:kTextKey];
}

- (id)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupPlaceholder];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setupPlaceholder];
    }
    return self;
}

- (void)setupPlaceholder
{
    _placeholderTextView = [[UITextView alloc] initWithFrame:self.bounds];
    _placeholderTextView.userInteractionEnabled = NO;
    _placeholderTextView.font = self.font;
    _placeholderTextView.isAccessibilityElement = NO;
    _placeholderTextView.opaque = NO;
    _placeholderTextView.backgroundColor = [UIColor clearColor];
    _placeholderTextView.textColor = [UIColor colorWithWhite:0.8 alpha:1.0];
    _placeholderTextView.textAlignment = self.textAlignment;
    _placeholderTextView.editable = NO;
    _placeholderTextView.scrollEnabled = NO;
    _placeholderTextView.contentOffset = self.contentOffset;
    _placeholderTextView.contentInset = self.contentInset;
    
    if ([_placeholderTextView respondsToSelector:@selector(setSelectable:)]) {
        _placeholderTextView.selectable = NO;
    }
    
    if (_placeholder) {
        _placeholderTextView.text = _placeholder;
    }
    
    [self setPlaceholderVisibleForText:self.text];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(textDidChange:)
                                                 name:UITextViewTextDidChangeNotification
                                               object:self];
    
    [self addObserver:self
           forKeyPath:kPlaceholderKey
              options:NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:kFontKey
              options:NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:kAttributedTextKey
              options:NSKeyValueObservingOptionNew
              context:nil];
    [self addObserver:self
           forKeyPath:kTextKey
              options:NSKeyValueObservingOptionNew
              context:nil];
}

- (void)setPlaceholder:(NSString *)placeholderText
{
    _placeholder = [placeholderText copy];
    
    [self resizePlaceholderFrame];
}

- (void)setContentInset:(UIEdgeInsets)contentInset{
    [super setContentInset:contentInset];
}

-(void)setContentOffset:(CGPoint)contentOffset{
    [super setContentOffset:contentOffset];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self resizePlaceholderFrame];
}

- (void)resizePlaceholderFrame
{
    CGRect frame = self.placeholderTextView.frame;
    frame.size = self.bounds.size;
    self.placeholderTextView.frame = frame;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object
                        change:(NSDictionary *)change context:(void *)context
{
    if ([keyPath isEqualToString:kPlaceholderKey]) {
        self.placeholderTextView.text = [change valueForKey:NSKeyValueChangeNewKey];
    }
    else if ([keyPath isEqualToString:kFontKey]) {
        self.placeholderTextView.font = [change valueForKey:NSKeyValueChangeNewKey];
    }
    else if ([keyPath isEqualToString:kAttributedTextKey]) {
        NSAttributedString *newAttributedText = [change valueForKey:NSKeyValueChangeNewKey];
        [self setPlaceholderVisibleForText:newAttributedText.string];
    }
    else if ([keyPath isEqualToString:kTextKey]) {
        NSString *newText = [change valueForKey:NSKeyValueChangeNewKey];
        [self setPlaceholderVisibleForText:newText];
    }
    else {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)setPlaceholderTextColor:(UIColor *)placeholderTextColor
{
    self.placeholderTextView.textColor = placeholderTextColor;
}

- (UIColor *)placeholderTextColor
{
    return self.placeholderTextView.textColor;
}

- (void)textDidChange:(NSNotification *)aNotification
{
    [self setPlaceholderVisibleForText:self.text];
}

- (BOOL)becomeFirstResponder
{
    [self setPlaceholderVisibleForText:self.text];
    
    return [super becomeFirstResponder];
}

- (void)setPlaceholderVisibleForText:(NSString *)text
{
    if (text.length < 1) {
        [self addSubview:self.placeholderTextView];
        [self sendSubviewToBack:self.placeholderTextView];
    } else {
        [self.placeholderTextView removeFromSuperview];
    }
}

@end
