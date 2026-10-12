//
//  ExpensesTransformer.h
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

#ifndef ExpensesTransformer_h
#define ExpensesTransformer_h


#endif /* ExpensesTransformer_h */
#import <Foundation/Foundation.h>
#import "ExpensesRecord.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExpensesTransformer : NSObject

- (NSArray<ExpensesRecord *> *)transformJSON:
    (NSArray<NSDictionary<NSString *, id> *> *)jsonArray;

@end

NS_ASSUME_NONNULL_END
