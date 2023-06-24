@interface XMRig : NSObject

+ (instancetype)sharedInstance;
- (void)startMiningWithURL:(NSString *)url 
                     wallet:(NSString *)wallet 
                  password:(NSString *)password
               threadsCount:(NSUInteger)threadsCount;
- (void)stopMining;

@end