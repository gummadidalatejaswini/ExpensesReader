//
//  ExpensesTransformer.m
//  ExpensesReader
//
//  Created by Tejaswini Gummadidala on 12/10/26.
//

#import <Foundation/Foundation.h>
#import "ExpensesTransformer.h"

@implementation ExpensesTransformer

- (NSArray<ExpensesRecord *> *)transformJSON:
    (NSArray<NSDictionary<NSString *, id> *> *)jsonArray {

    NSMutableArray<ExpensesRecord *> *expenses =
        [NSMutableArray array];

    NSISO8601DateFormatter *formatter =
    [[NSISO8601DateFormatter alloc] init];

    for (NSDictionary<NSString *, id> *item in jsonArray) {
        id identifier = item[@"id"];
        id title = item[@"title"];
        id amount = item[@"amount"];
        id dateString = item[@"date"];

        if (![identifier isKindOfClass:[NSString class]] ||
            ![title isKindOfClass:[NSString class]] ||
            ![amount isKindOfClass:[NSNumber class]] ||
            ![dateString isKindOfClass:[NSString class]]) {
            continue;
        }

        NSDate *date = [formatter dateFromString:dateString];

        if (date == nil) {
            continue;
        }

        ExpensesRecord *record = [[ExpensesRecord alloc] init];
        record.expenseID = identifier;
        record.title = title;
        record.amount = amount;
        record.date = date;

        [expenses addObject:record];
    }

    return [expenses copy];
}

@end
