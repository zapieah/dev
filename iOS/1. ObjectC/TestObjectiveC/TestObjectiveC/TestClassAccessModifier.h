//
//  TestClassAccessModifier.h
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 6..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestClassAccessModifier : NSObject
{
    //protected
    int defaultValue;
    @public
    int publicValue;
    @protected
    int protectedValue;
    @private
    int privateValue;
}

-(id) init;
@end
