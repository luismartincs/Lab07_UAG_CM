//
//  Details.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 28/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Details.h"
#import "Map.h"

@interface Details ()
    @property NSDictionary *townsLocation;

@end

@implementation Details

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

-(void)viewWillAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:_destinationTitle];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initController{
    _titleDetails.text = _destinationTitle;
    _descriptionDetails.text = _destinationDescription;
    _imageDetails.image = [UIImage imageNamed:_destinationPhoto];
    
    _townsLocation = @{
                       @"San Francisco de Campeche":@[@"19.8365702",@"-90.5384527"],
                       @"Ciudad del Carmen":@[@"18.649167", @"-91.807621"],
                       @"Champotón":@[@"19.346677", @"-90.720442"],
                       @"Palizada":@[@"18.2583257",@"-92.0960948"],
                       @"Xpujil":@[@"18.503036", @"-89.394195"],
                       @"Puerto Vallarta":@[@"20.654327", @"-105.224746"],
                       @"Guadalajara":@[@"20.6706159",@"-103.3636523"],
                       @"Tequila":@[@"20.881509",@"-103.832548"],
                       @"Degollado":@[@"20.448152",@"-102.132057"],
                       @"Mazamitla":@[@"19.915279",@"-103.019870"],
                       @"Mérida":@[@"20.965650",@"-89.592736"],
                       @"Valladolid":@[@"20.688958",@"-88.201697"],
                       @"Progreso":@[@"21.280479",@"-89.664724"],
                       @"Izamal":@[@"20.929220",@"-89.022513"],
                       @"Tizimín":@[@"21.144572",@"-88.150111"],
                       @"San Cristóbal de Las Casas":@[@"16.735738",@"-92.637964"],
                       @"Palenque":@[@"17.510207",@"-91.992690"],
                       @"Tuxtla Gutiérrez":@[@"16.749549",@"-93.102797"],
                       @"Tapachula":@[@"14.903994",@"-92.263366"],
                       @"Chiapa de Corzo":@[@"16.701033",@"-93.008313"],
                       @"Monterrey":@[@"25.685966",@"-100.316576"],
                       @"Santiago":@[@"25.415916",@"-100.159327"],
                       @"Bustamante":@[@"26.533945",@"-100.505876"],
                       @"Montemorelos":@[@"25.186413",@"-99.829661"],
                       @"Galeana":@[@"24.825235",@"-100.077081"]
                       
                       };
}
- (IBAction)verMapa:(id)sender {
    [self performSegueWithIdentifier:@"Map" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[Map class]]){
        
        Map *destination = [segue destinationViewController];
        destination.latitude = _townsLocation[_destinationTitle][0];
        destination.longitude = _townsLocation[_destinationTitle][1];
        destination.place = _destinationTitle;
        destination.city = _city;
        
    }
}

@end
