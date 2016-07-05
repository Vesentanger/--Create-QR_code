//
//  ViewController.m
//  生成二维码
//
//  Created by 梅守强 on 16/1/4.
//  Copyright © 2016年 eshine. All rights reserved.
//

#import "ViewController.h"
#import <CoreImage/CoreImage.h>


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextView *tv;
@property (weak, nonatomic) IBOutlet UIImageView *image;

@end

@implementation ViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    //CIFilter
    CIFilter *filter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    
    [filter setDefaults];
    NSData *data = [self.tv.text dataUsingEncoding:NSUTF8StringEncoding];
    [filter setValue:data forKey:@"inputMessage"];
    
    CIImage *image = [filter outputImage];
    
    UIImage *resultImage = [UIImage imageWithCIImage:image];
    
    self.image.image = resultImage;
}

@end
