//
//  PaoMaLabel.m
//  paoma
//
//  Created by xiang_ying on 13-10-28.
//  Copyright (c) 2013年 xiang_ying. All rights reserved.
//

#import "PaoMaLabel.h"

@interface PaoMaLabel(){
    NSTimer *aniamteTimer;
    NSMutableString     *tmpString;
    NSString        *ctext;
    
    CGFloat         offset,textWidth;
    
    NSString        *appendStr;
}
@end

@implementation PaoMaLabel

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        appendStr = @"   ";
    }
    return self;
}

-(NSString*)getText{
    return ctext;
}

-(void)setFont:(UIFont *)font{
    [super setFont:font];
    [self drawText];
}

-(void)setTextColor:(UIColor *)textColor{
    [super setTextColor:textColor];
    [self drawText];
}

-(void)setText:(NSString *)text{
    ctext = text;
    [self drawText];
}

- (void)drawText{
    if (!ctext) {
        return;
    }
    offset = 0;
    textWidth = 0;
    
    if (self.frame.size.width<[self stringShowWidth:ctext].width) {
        //跑
        tmpString = [NSMutableString stringWithFormat:@"%@%@%@",ctext,appendStr,ctext];
        if (!aniamteTimer) {
            aniamteTimer = [NSTimer scheduledTimerWithTimeInterval:0.05 target:self selector:@selector(paoma) userInfo:nil repeats:YES];
        }
    }else{
        textWidth = self.frame.size.width;
        if (aniamteTimer) {
            [aniamteTimer invalidate];
            aniamteTimer = nil;
        }
        tmpString = [NSMutableString stringWithString:ctext];
    }
    [self setNeedsDisplay];
}

- (CGSize)stringShowWidth:(NSString *)pString
{
	NSString *string = pString;
	
	CGSize constraintSize = CGSizeMake(MAXFLOAT, self.frame.size.height);
	
	CGSize labelSize = [string sizeWithFont:self.font
						  constrainedToSize:constraintSize
							  lineBreakMode:NSLineBreakByWordWrapping];
    
    textWidth = [[NSString stringWithFormat:@"%@%@",appendStr,string] sizeWithFont:self.font
                                                                 constrainedToSize:constraintSize
                                                                     lineBreakMode:NSLineBreakByWordWrapping].width;
	return labelSize;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    [self.textColor set];
    [tmpString drawInRect:CGRectMake(rect.origin.x-offset, rect.origin.y, 2*textWidth, rect.size.height) withFont:self.font lineBreakMode:NSLineBreakByClipping alignment:self.textAlignment];
    
}

-(void)paoma{
    
    offset++;
    
    if (offset>textWidth) {
        offset = 0;
    }
    
    //    if (tmpString.length > ctext.length) {
    //        offset++;
    //        [tmpString deleteCharactersInRange:NSMakeRange(0, 1)];
    //    }else{
    //        [tmpString appendString:[NSString stringWithFormat:@"  %@",ctext]];
    //    }
    [self setNeedsDisplay];
}

@end
