//
//  FishDisplayCard.m
//  Spike_CollectionView
//
//  Created by Greg Tarsa on 2/1/14.
//  Copyright (c) 2014 Greg Tarsa. All rights reserved.
//

#import "FishDisplayCard.h"

#define IMAGE_HEIGHT 50
#define IMAGE_WIDTH 32
//#define IMAGE_HEIGHT 100
//#define IMAGE_WIDTH 64

@implementation FishDisplayCard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        CGSize imageSize = self.cardImageView.image.size;
        
        self.cardImageView = [UIImageView new];
        self.cardImageView.frame = CGRectMake(0.0, 0.0, imageSize.width, imageSize.height);
        [self.contentView addSubview:self.cardImageView];
        
//        CGSize cellSize = self.frame.size;
//        self.cardImageView.frame = CGRectMake(cellSize.width/2 - (IMAGE_WIDTH / 2),
//                                              cellSize.height/2 - (IMAGE_HEIGHT / 2),
//                                              IMAGE_WIDTH,
//                                              IMAGE_HEIGHT);

        
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
