//
//  FirstViewController.h
//  test
//
//  Created by Kenichiro Yamaguchi on 2012/09/03.
//  Copyright (c) 2012年 Kenichiro Yamaguchi. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface FirstViewController : UIViewController<CLLocationManagerDelegate> {
    MKMapView __strong *mapFirst;
    UILabel __weak *labelCurrent;
    CLLocationManager *locationManager;
    CLLocationCoordinate2D coordinate;
}
@property (strong, nonatomic) IBOutlet MKMapView *mapFirst;
@property (weak, nonatomic) IBOutlet UILabel *labelCurrent;
@property (nonatomic, retain) CLLocationManager *locationManager;
@property (nonatomic) CLLocationCoordinate2D coordinate;

@end
