//
//  ExpensesRecord.h
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

#ifndef ExpensesRecord_h
#define ExpensesRecord_h


#endif /* ExpensesRecord_h */
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExpensesRecord : NSObject

@property (nonatomic, copy) NSString *expenseID;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSNumber *amount;
@property (nonatomic, strong) NSDate *date;

@end

NS_ASSUME_NONNULL_END
