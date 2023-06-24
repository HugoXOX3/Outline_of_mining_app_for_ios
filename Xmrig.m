#import "XMRig.h"
#import <XMRig/xmrig.h>

@implementation XMRig {
    xmrig::Miner *miner;
}

+ (instancetype)sharedInstance {
    static XMRig *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

- (void)startMiningWithURL:(NSString *)url  
                     wallet:(NSString *)wallet 
                  password:(NSString *)password
               threadsCount:(NSUInteger)threadsCount {
    // Start XMRig miner in background thread
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        xmrig::Options options = parseOptions();
        miner = new xmrig::Miner(&options);
        miner.start();
    }); 
}

- (void)stopMining {
    // Stop XMRig miner
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        miner->stop();
        delete miner;
    });
}

@end