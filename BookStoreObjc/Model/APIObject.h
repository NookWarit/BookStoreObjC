#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
@interface MultimediaDataModel : NSObject
@property (nonatomic, retain) NSString *imgUrl, *format;

@end

@interface APIObject : NSObject
@property (nonatomic,retain) NSString *title, *abstract, *url, *byline;
@property (nonatomic,retain) NSMutableArray<MultimediaDataModel *> *multi;
+(APIObject *) createApiObject: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
