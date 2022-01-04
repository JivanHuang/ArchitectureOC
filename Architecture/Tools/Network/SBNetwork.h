
#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, SBNetworkStatusType) {
    /// 未知网络
    SBNetworkStatusUnknown,
    /// 无网络
    SBNetworkStatusNotReachable,
    /// 手机网络
    SBNetworkStatusReachableViaWWAN,
    /// WIFI网络
    SBNetworkStatusReachableViaWiFi
};

typedef NS_ENUM(NSUInteger, SBRequestSerializer) {
    /// 设置请求数据为JSON格式
    SBRequestSerializerJSON,
    /// 设置请求数据为二进制格式
    SBRequestSerializerHTTP,
};

typedef NS_ENUM(NSUInteger, SBResponseSerializer) {
    /// 设置响应数据为JSON格式
    SBResponseSerializerJSON,
    /// 设置响应数据为二进制格式
    SBResponseSerializerHTTP,
};

/// 请求成功的Block
typedef void(^SBHttpRequestSuccess)(id responseObject);

/// 请求失败的Block
typedef void(^SBHttpRequestFailed)(NSError *error);

/// 缓存的Block
typedef void(^SBHttpRequestCache)(id responseCache);

/// 上传或者下载的进度, Progress.completedUnitCount:当前大小 - Progress.totalUnitCount:总大小
typedef void (^SBHttpProgress)(NSProgress *progress);

/// 网络状态的Block
typedef void(^SBNetworkStatus)(SBNetworkStatusType status);

@class AFHTTPSessionManager;
@interface SBNetwork : NSObject

/// 有网YES, 无网:NO
+ (BOOL)isNetwork;

/// 手机网络:YES, 反之:NO
+ (BOOL)isWWANNetwork;

/// WiFi网络:YES, 反之:NO
+ (BOOL)isWiFiNetwork;

/// 取消所有HTTP请求
+ (void)cancelAllRequest;

/// 实时获取网络状态,通过Block回调实时获取(此方法可多次调用)
+ (void)networkStatusWithBlock:(SBNetworkStatus)networkStatus;

/// 取消指定URL的HTTP请求
+ (void)cancelRequestWithURL:(NSString *)URL;

/// 开启日志打印 (Debug级别)
+ (void)openLog;

/// 关闭日志打印,默认关闭
+ (void)closeLog;

/// get请求,无缓存
/// @param URL 请求地址
/// @param parameters 请求参数
/// @param success 请求成功的回调
/// @param failure 请求失败的回调
+ (__kindof NSURLSessionTask *)get:(NSString *)URL
                        parameters:(id)parameters
                           headers:(NSDictionary <NSString *, NSString *> *)headers
                           success:(SBHttpRequestSuccess)success
                           failure:(SBHttpRequestFailed)failure;

/// get请求,自动缓存
/// @param URL 请求地址
/// @param parameters 请求参数
/// @param responseCache  缓存数据的回调
/// @param success 请求成功的回调
/// @param failure 请求失败的回调
+ (__kindof NSURLSessionTask *)get:(NSString *)URL
                        parameters:(id)parameters
                           headers:(NSDictionary <NSString *, NSString *> *)headers
                     responseCache:(SBHttpRequestCache)responseCache
                           success:(SBHttpRequestSuccess)success
                           failure:(SBHttpRequestFailed)failure;

/// post请求,无缓存
/// @param URL 请求地址
/// @param parameters 请求参数
/// @param success 请求成功的回调
/// @param failure 请求失败的回调
+ (__kindof NSURLSessionTask *)post:(NSString *)URL
                         parameters:(id)parameters
                            headers:(NSDictionary <NSString *, NSString *> *)headers
                            success:(SBHttpRequestSuccess)success
                            failure:(SBHttpRequestFailed)failure;

/// post请求,自动缓存
/// @param URL 请求地址
/// @param parameters 请求参数
/// @param responseCache 缓存数据的回调
/// @param success 请求成功的回调
/// @param failure 请求失败的回调
+ (__kindof NSURLSessionTask *)post:(NSString *)URL
                         parameters:(id)parameters
                            headers:(NSDictionary <NSString *, NSString *> *)headers
                      responseCache:(SBHttpRequestCache)responseCache
                            success:(SBHttpRequestSuccess)success
                            failure:(SBHttpRequestFailed)failure;

/// 上传文件
/// @param URL 请求地址
/// @param parameters 请求参数
/// @param name 文件对应服务器上的字段
/// @param filePath  文件本地的沙盒路径
/// @param progress  上传进度信息
/// @param success  请求成功的回调
/// @param failure  请求失败的回调
+ (__kindof NSURLSessionTask *)uploadFileWithURL:(NSString *)URL
                                      parameters:(id)parameters
                                         headers:(NSDictionary <NSString *, NSString *> *)headers
                                            name:(NSString *)name
                                        filePath:(NSString *)filePath
                                        progress:(SBHttpProgress)progress
                                         success:(SBHttpRequestSuccess)success
                                         failure:(SBHttpRequestFailed)failure;

/// 上传单/多张图片
/// @param URL 请求地址
/// @param parameters 请求参数
/// @param name   图片对应服务器上的字段
/// @param images 图片数组
/// @param fileNames  图片文件名数组, 可以为nil, 数组内的文件名默认为当前日期时间"yyyyMMddHHmmss"
/// @param imageScale  图片文件压缩比 范围 (0.f ~ 1.f)
/// @param imageType 图片文件的类型,例:png、jpg(默认类型)....
/// @param progress 上传进度信息
/// @param success 请求成功的回调
/// @param failure 请求失败的回调
+ (__kindof NSURLSessionTask *)uploadImagesWithURL:(NSString *)URL
                                        parameters:(id)parameters
                                           headers:(NSDictionary <NSString *, NSString *> *)headers
                                              name:(NSString *)name
                                            images:(NSArray<UIImage *> *)images
                                         fileNames:(NSArray<NSString *> *)fileNames
                                        imageScale:(CGFloat)imageScale
                                         imageType:(NSString *)imageType
                                          progress:(SBHttpProgress)progress
                                           success:(SBHttpRequestSuccess)success
                                           failure:(SBHttpRequestFailed)failure;

/// 下载文件
/// @param URL 请求地址
/// @param fileDir 文件存储目录(默认存储目录为Download)
/// @param progress 文件下载的进度信息
/// @param success 下载成功的回调(回调参数filePath:文件的路径)
/// @param failure 下载失败的回调
+ (__kindof NSURLSessionTask *)downloadWithURL:(NSString *)URL
                                       fileDir:(NSString *)fileDir
                                      progress:(SBHttpProgress)progress
                                       success:(void(^)(NSString *filePath))success
                                       failure:(SBHttpRequestFailed)failure;



//MARK:  设置AFHTTPSessionManager相关属性（注意: 因为全局只有一个AFHTTPSessionManager实例,所以以下设置方式全局生效）

/// 在开发中,如果以下的设置方式不满足项目的需求,就调用此方法获取AFHTTPSessionManager实例进行自定义设置
+ (void)setAFHTTPSessionManagerProperty:(void(^)(AFHTTPSessionManager *sessionManager))sessionManager;

/// 设置网络请求参数的格式:默认为二进制格式
/// @param requestSerializer SBRequestSerializerJSON(JSON格式),SBRequestSerializerHTTP(二进制格式),
+ (void)setRequestSerializer:(SBRequestSerializer)requestSerializer;

/// 设置服务器响应数据格式:默认为JSON格式
/// @param responseSerializer SBResponseSerializerJSON(JSON格式),SBResponseSerializerHTTP(二进制格式)
+ (void)setResponseSerializer:(SBResponseSerializer)responseSerializer;

/// 设置请求超时时间:默认为30S
/// @param time 时长
+ (void)setRequestTimeoutInterval:(NSTimeInterval)time;

/// 设置请求头
+ (void)setValue:(NSString *)value forHTTPHeaderField:(NSString *)field;

/// 是否打开网络状态转圈菊花:默认打开
/// @param open YES(打开), NO(关闭)
+ (void)openNetworkActivityIndicator:(BOOL)open;

///  配置自建证书的Https请求
/// @param cerPath 自建Https证书的路径
/// @param validatesDomainName 是否需要验证域名，默认为YES. 如果证书的域名与请求的域名不一致，需设置为NO; 即服务器使用其他可信任机构颁发的证书，也可以建立连接，这个非常危险, 建议打开.validatesDomainName=NO, 主要用于这种情况:客户端请求的是子域名, 而证书上的是另外一个域名。因为SSL证书上的域名是独立的,假如证书上注册的域名是www.google.com, 那么mail.google.com是无法验证通过的.
+ (void)setSecurityPolicyWithCerPath:(NSString *)cerPath validatesDomainName:(BOOL)validatesDomainName;

@end
