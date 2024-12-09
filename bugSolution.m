```objectivec
@interface MyClass : NSObject
@property (nonatomic, strong) NSString *someProperty;
@end

@implementation MyClass

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context {
    if ([keyPath isEqualToString:@"someProperty"]) {
        NSLog(@"someProperty changed!");
    }
}

- (void)dealloc {
    [someObject removeObserver:self forKeyPath:@"someProperty"];
    // ... cleanup other observers ...
}

- (void)startObserving:(NSObject*)someObject {
    [someObject addObserver:self forKeyPath:@"someProperty" options:NSKeyValueObservingOptionNew context:NULL];
}
@end

```