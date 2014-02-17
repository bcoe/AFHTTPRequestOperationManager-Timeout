AFHTTPRequestOperationManager + Timeout
=====================================

This code snippet overrides AFHTTPRequestOperationManager using a Category, and adds a timeoutInterval. Allowing the client to vary how long it takes a request to timeout.

This sample code is taken from http://qiita.com/bugcloud/items/80ea9a4da4624ef2391f, and is reproduced in this repo for refrence.

Usage
-----

```objectivec
#import "AFHTTPRequestOperationManager+Timeout.h"

@implementation Sample

+ (void)fetchSamples:(NSDictionary *)params
             success:(void (^)(AFHTTPRequestOperation *operation, id responseObject))success
              failed:(void (^)(AFHTTPRequestOperation *operation, NSError *error))failed
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    [manager GET:@“SOME_PATH”
      parameters:@{}
 timeoutInterval:10.0f
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             success(operation, responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             failed(operation, error);
         }];
}

@end
```
