//
//  WikiViewController.m
//  DotaCompanion
//
//  Created by Steven Van der merwe on 2013/05/16.
//  Copyright (c) 2013 Steven Van der merwe. All rights reserved.
//

#import "WikiViewController.h"

@interface WikiViewController ()

@end

@implementation WikiViewController
@synthesize url = _url;
@synthesize wikiURL = _wikiURL;

-(id)initWithWikiPage:(NSString *)url
{
    self = [super initWithNibName:@"WikiViewController" bundle:[NSBundle mainBundle]];
    self.url = url;
    return self;
}

-(void)setUrl:(NSString *)url
{
    _url = url;
    self.wikiURL = [NSURL URLWithString:_url];
    
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
	// Do any additional setup after loading the view.
//    CGRect screenFrame = [[UIScreen mainScreen] bounds];
//    self.webView = [[UIWebView alloc] initWithFrame:CGRectMake(screenFrame.origin.x, screenFrame.origin.y, screenFrame.size.width, screenFrame.size.height)];
//    [self.view addSubview:self.webView];
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:self.wikiURL];
//    
//    //Load the request in the UIWebView.
//    [self.webView loadRequest:requestObj];
    
    ///
    //RATHER PERFORMSEGUEWITHIDENTIFIER
    
    ///
    self.webView.delegate = self;
//    NSString *urlAddress = @"http://www.dota2wiki.com/wiki/Invictus_Gaming";
//    
//    //Create a URL object.
//    NSURL *url2 = [NSURL URLWithString:urlAddress];
//    
//    //URL Requst Object
//    NSURLRequest *requestObj = [NSURLRequest requestWithURL:url2];
//    
//    //Load the request in the UIWebView.
//    [_webView loadRequest:requestObj];
    
    NSString *httpSource = @"http://designwoop.com/";
    NSURL *fullUrl = [NSURL URLWithString:httpSource];
    NSURLRequest *httpRequest = [NSURLRequest requestWithURL:self.wikiURL];
    //NSLog(@"%@",self.wikiURL);
    //NSLog(@"%@",self.url);
    [self.webView loadRequest:httpRequest];
}

-(void)webViewDidStartLoad:(UIWebView *)webView
{
    //NSLog(@"Starting webView load");
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    //NSLog(@"Finishing webView load");
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    //NSLog(@"WebView failed with error: %@",error);
}

- (IBAction)forwardPressed:(id)sender
{
    if (self.webView.canGoForward) {
        [self.webView goForward];
    }
}

- (IBAction)backPressed:(id)sender
{
    if (self.webView.canGoBack) {
        [self.webView goBack];
    }
}

- (IBAction)navigationBackPressed:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
