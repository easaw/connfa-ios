//
//  DCFilterCheckBox.m
//  DrupalCon
//
//  Created by Volodymyr Hyrka on 2/24/15.
//  Copyright (c) 2015 Lemberg Solution. All rights reserved.
//

#import "DCFilterCheckBox.h"


@implementation DCFilterCheckBox

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self customization];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self)
    {
        [self customization];
    }
    return self;
}

- (void)customization
{
    self.userInteractionEnabled = YES;
    [self setBackgroundColor:[UIColor clearColor]];
    
    UITapGestureRecognizer* tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onClick)];
    [self addGestureRecognizer: tapRecognizer];
    
    [self setSelected:NO];
}

- (void)onClick
{
    [self setSelected:!self.selected];
    
    if (_delegate && [_delegate respondsToSelector:@selector(DCFilterCheckBox:didChangedState:)])
    {
        [_delegate DCFilterCheckBox:self didChangedState:self.selected];
    }
}

#pragma mark - get/set

- (BOOL)isSelected
{
    return _selected;
}

-(void)setSelected:(BOOL)selected
{
    _selected = selected;
    [self setImage:[UIImage imageNamed:(_selected ? @"star_on" : @"star_off_v2")]];
}

@end