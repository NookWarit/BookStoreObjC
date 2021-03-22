//
//  APIObject.h
//  BookStoreObjc
//
//  Created by Foodstory on 22/3/2564 BE.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface MultimediaDataModel : NSObject
@property (nonatomic, assign) NSString *imgUrl, *format;

@end

@interface APIObject : NSObject
@property (nonatomic,assign) NSString *title, *abstract, *url, *byline;
@property (nonatomic, retain) MultimediaDataModel *multi;
+(APIObject *) createApiObject: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
