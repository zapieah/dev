//
//  TestKeyValueObserver.m
//  TestObjectiveC
//
//  Created by bogon on 2016. 12. 12..
//  Copyright © 2016년 com.bogon. All rights reserved.
//

#import "TestKeyValueObserver.h"

@implementation TestKeyValueObserver

-(void)registerAsObserver {
//    [account addObserver:inspector
//              forKeyPath:@"openingBalance"
//                 options:(NSKeyValueObservingOptionNew |
//                          NSKeyValueObservingOptionOld)
//                 context:NULL];
}

- (void)observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context {
    
//    if ([keyPath isEqual:@"openingBalance"]) {
//        [openingBalanceInspectorField setObjectValue:
//         [change objectForKey:NSKeyValueChangeNewKey]];
//    }
//    /*
//     Be sure to call the superclass's implementation *if it implements it*.
//     NSObject does not implement the method.
//     */
//    [super observeValueForKeyPath:keyPath
//                         ofObject:object
//                           change:change
//                          context:context];
}


- (void)unregisterForChangeNotification {
//    [observedObject removeObserver:inspector forKeyPath:@"openingBalance"];
}
@end
