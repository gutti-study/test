//
//  FirstViewController.m
//  test
//
//  Created by Kenichiro Yamaguchi on 2012/09/03.
//  Copyright (c) 2012年 Kenichiro Yamaguchi. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()

@end

@implementation FirstViewController
@synthesize mapFirst, labelCurrent, locationManager, coordinate;
// @synthesize mapFirst;
// @synthesize labelCurrent;
// @synthesize coordinate;

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
    labelCurrent.text = @"Default";
    locationManager = [[CLLocationManager alloc] init];
    
    NSLog(@"DidLoad");
    if ([CLLocationManager locationServicesEnabled]) {
        locationManager.delegate = self;
        [locationManager startUpdatingLocation];
        mapFirst.showsUserLocation = YES;
        labelCurrent.text = @"Location services enable";
    } else {
        NSLog(@"Location services not available.");
    }
	// Do any additional setup after loading the view.
}

// 位置情報更新時
- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation
{
    MKCoordinateRegion region = mapFirst.region;
    region.center = newLocation.coordinate;
    region.span.latitudeDelta = 0.05;
    region.span.longitudeDelta = 0.05;
    [mapFirst setRegion:region];
    
    //緯度・経度を出力
    NSLog(@"didUpdateToLocation latitude=%f, longitude=%f",
          [newLocation coordinate].latitude,
          [newLocation coordinate].longitude);
    [locationManager stopUpdatingLocation];
}

// 測位失敗時や、位置情報の利用をユーザーが「不許可」とした場合などに呼ばれる
- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError");
}

- (void)viewDidUnload
{
    [self setLocationManager:nil];
    [self setLabelCurrent:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
