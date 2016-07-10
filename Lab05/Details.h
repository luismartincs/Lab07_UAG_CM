//
//  Details.h
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 28/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Google/Analytics.h>

@interface Details : UIViewController

@property NSString *destinationTitle;
@property NSString *destinationDescription;
@property NSString *destinationPhoto;
@property (nonatomic) NSString *city;


@property (strong, nonatomic) IBOutlet UIImageView *imageDetails;
@property (strong, nonatomic) IBOutlet UILabel *titleDetails;
@property (strong, nonatomic) IBOutlet UILabel *descriptionDetails;
- (IBAction)verMapa:(id)sender;

@end
