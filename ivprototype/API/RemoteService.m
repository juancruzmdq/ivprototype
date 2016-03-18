//
//  RemoteService.m
//  ivprototype
//
//  Created by Juan Cruz Ghigliani on 14/3/16.
//  Copyright (c) 2016 Juan Cruz Ghigliani. All rights reserved.
//

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Imports

#import "RemoteService.h"
#import <AFNetworking/AFNetworking.h>

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Types

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Defines & Constants

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Macros

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Interface
@interface RemoteService ()

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private Properties
@property (nonatomic, strong) AFHTTPSessionManager *manager;
@property(nonatomic, strong) NSMutableDictionary *resources;

@end

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Implementation

@implementation RemoteService

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Synthesize

/* Public *********************************************************************/

/* Private ********************************************************************/

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Setup & Teardown

- (id)initWithBaseURL:(NSString *)baseURL
{
    self = [super init];
    if (self)
    {
        self.resources = [NSMutableDictionary dictionary];
        
        self.manager = [[AFHTTPSessionManager alloc]initWithBaseURL:[NSURL URLWithString:baseURL] sessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        self.manager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)dealloc
{
}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Superclass Overrides

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Custom Accessors

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Public methods

-(void)addResource:(RemoteResource *)resource forKey:(NSString*)key{
    [self.resources setObject:resource forKey:key];
}



-(void)getResource:(NSString *)resourceKey
         onSuccess:(void (^)(id _Nonnull))success
         onFailure:(void (^)(NSError * _Nonnull))failure{
    RemoteResource *resource = [self.resources objectForKey:resourceKey];
    [self.manager GET:resource.path
           parameters:resource.params
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  success(resource.parse(responseObject));
              } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  failure(error);
              }];

}

////////////////////////////////////////////////////////////////////////////////
#pragma mark - Private methods



@end
