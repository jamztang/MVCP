//
//  NSObject+Subclass.h
//  cells
//
//  Created by James Tang on 20/5/14.
//  Copyright (c) 2014 James Tang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

typedef struct selBlockPair { SEL aSEL; id (^__unsafe_unretained aBlock)(id, ...); } selBlockPair;
#define NIL_PAIR ((struct selBlockPair) { 0, 0 })
#define PAIR_LIST (struct selBlockPair [])
#define BLOCK_CAST (id (^)(id, ...))

@interface NSObject (Subclass)

+ (Class)newSubclassNamed:(NSString *)name
                protocols:(Protocol **)protos
                    impls:(selBlockPair *)impls;

@end