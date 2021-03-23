#import "APIObject.h"

@implementation APIObject
+ (APIObject *)createApiObject:(NSDictionary *)dict {
    APIObject *api = [[APIObject alloc] init];
    api.title = [dict objectForKey:@"title"];
    api.abstract = [dict objectForKey:@"abstract"];
    api.url = [dict objectForKey:@"url"];
    api.byline = [dict objectForKey:@"byline"];
//    api.multi
    
    NSArray *arr = [dict objectForKey:@"multimedia"];
    if (![arr isEqual:[NSNull null]]) {
        NSLog(@"arr --> %@", dict);
        api.multi = [NSMutableArray new];
        for (NSDictionary *multi in arr) {
            MultimediaDataModel *temp = [[MultimediaDataModel alloc]init];
            temp.imgUrl = [multi objectForKey:@"url"];
            temp.format = [multi objectForKey:@"format"];
            [api.multi addObject:temp];
        }
    }
    
    return  api;
}

@end

@implementation MultimediaDataModel



@end
