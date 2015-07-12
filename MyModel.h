//
//  MyModel.h
//  ling
//
//  Created by lb on 15/6/27.
//  Copyright (c) 2015年 凌兵. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyModel : NSObject
-(void)setValue:(id)value forUndefinedKey:(NSString *)key;
-(id)valueForUndefinedKey:(NSString *)key;
@end
