//
//  APIObject.m
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import "APIObject.h"

@implementation APIObject
+ (APIObject *)createApiObject:(NSDictionary *)dict {
    APIObject *api = [[APIObject alloc] init];
    api.title = [dict objectForKey:@"title"];
    api.abstract = [dict objectForKey:@"abstact"];
    api.url = [dict objectForKey:@"url"];
    api.byline = [dict objectForKey:@"byline"];
    
    NSArray *arr = [dict objectForKey:@"multimedia"];
    MultimediaDataModel *temp = [[MultimediaDataModel alloc]init];
    for (NSDictionary *multi in arr) {
        temp.imgUrl = [multi objectForKey:@"url"];
        temp.format = [multi objectForKey:@"format"];
    }
    
    return  api;
}

@end

@implementation MultimediaDataModel



@end
