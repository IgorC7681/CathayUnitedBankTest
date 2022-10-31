//
//  ViewController.m
//  CathayUnitedBankTest
//
//  Created by TaiYi Chien on 2022/10/20.
//

#import "ViewController.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *kokoidLabel;
@property (weak, nonatomic) IBOutlet UIView *dotView;
@property (nonatomic) NSString *name;
@property (nonatomic) NSString *kokoid;
@property (nonatomic) NSString *status;
@property (nonatomic) NSString *isTop;
@property (nonatomic) NSString *fid;
@property (nonatomic) NSString *updateDate;
@property (nonatomic) NSArray *apiArray;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [self jsonParseMain];
    //[self jsonParseFriend1];
    //[self jsonParseFriend2];
    //[self jsonParseFriend3];
    //[self jsonParseFriend4];
}

- (void)viewDidAppear:(BOOL)animated
{
    _nameLabel.text = _name;
    _kokoidLabel.text = @"KOKO ID：";
    _kokoidLabel.text = [_kokoidLabel.text stringByAppendingString: _kokoid];
    _dotView.alpha = 0.0f;
}

-(void)jsonParseMain
{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"https://dimanyen.github.io/man.json"];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&jsonError];
        NSArray *apiResponse = [json objectForKey:@"response"];
        NSDictionary *dataDictionary = [apiResponse objectAtIndex:0];
        self->_name = [dataDictionary objectForKey:@"name"];
        self->_kokoid = [dataDictionary objectForKey:@"kokoid"];
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    [dataTask resume];
}

-(void)jsonParseFriend1
{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"https://dimanyen.github.io/friend1.json"];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&jsonError];
        self->_apiArray = [json objectForKey:@"response"];
        NSLog(@"apiArray: %lu",self->_apiArray.count);
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    [dataTask resume];
}

-(void)jsonParseFriend2
{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"https://dimanyen.github.io/friend2.json"];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&jsonError];
        NSArray *apiResponse = [json objectForKey:@"response"];
        NSLog(@"apiResponse: %@",apiResponse);
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    [dataTask resume];
}

-(void)jsonParseFriend3
{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"https://dimanyen.github.io/friend3.json"];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&jsonError];
        NSArray *apiResponse = [json objectForKey:@"response"];
        NSLog(@"apiResponse: %@",apiResponse);
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    [dataTask resume];
}

-(void)jsonParseFriend4
{
    NSURLSessionConfiguration *defaultSessionConfiguration = [NSURLSessionConfiguration defaultSessionConfiguration];
    NSURLSession *defaultSession = [NSURLSession sessionWithConfiguration:defaultSessionConfiguration];
    NSURL *url = [NSURL URLWithString:@"https://dimanyen.github.io/friend4.json"];
    NSURLSessionDataTask *dataTask = [defaultSession dataTaskWithURL: url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        NSError *jsonError;
        NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                              options:NSJSONReadingMutableContainers
                                                error:&jsonError];
        NSArray *apiResponse = [json objectForKey:@"response"];
        NSLog(@"apiResponse: %@",apiResponse);
        CFRunLoopStop(CFRunLoopGetCurrent());
    }];
    [dataTask resume];
}

@end
