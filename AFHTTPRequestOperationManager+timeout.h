#import <Foundation/Foundation.h>
#import "AFHTTPRequestOperationManager.h"

@interface AFHTTPRequestOperationManager (TimeoutCategory)

/**
 *  Add timeout interval parameter to AFHTTPRequestOperationManager#GET
 *
 *  @param timeoutInterval
 *  Other parameters See AFHTTPRequestOperationManager#GET
 *
 *  @return See AFHTTPRequestOperationManager#GET
 */
- (AFHTTPRequestOperation *)GET:(NSString *)URLString
                     parameters:(NSDictionary *)parameters
                timeoutInterval:(NSTimeInterval)timeoutInterval
                        success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                        failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

/**
 *  Add timeout interval parameter to AFHTTPRequestOperationManager#POST
 *
 *  @param timeoutInterval
 *  Other parameters See AFHTTPRequestOperationManager#POST
 *
 *  @return See AFHTTPRequestOperationManager#POST
 */
- (AFHTTPRequestOperation *)POST:(NSString *)URLString
                      parameters:(NSDictionary *)parameters
                 timeoutInterval:(NSTimeInterval)timeoutInterval
                         success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
                         failure:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
