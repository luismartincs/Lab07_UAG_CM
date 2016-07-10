//
//  ViewController.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 27/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Start.h"
#import "cellHome.h"
#import "Towns.h"
#import <DigitsKit/DigitsKit.h>



@interface Start ()

@property NSMutableArray *destinationTitles;
@property NSMutableArray *destinationImgs;
@property NSMutableArray *destinationDescriptions;
@property NSString *city;


@end

@implementation Start

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

-(void)viewWillAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:@"Home"];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table

-(void)initController{
    
    _destinationTitles = [[NSMutableArray alloc] initWithObjects:@"Campeche",@"Jalisco",@"Yucatán",@"Chiapas",@"Nuevo León",nil];
    
    _destinationImgs = [[NSMutableArray alloc] initWithObjects:@"campeche.jpg",@"jalisco.jpg",@"yucatan.jpg",@"chiapas.jpg",@"monterrey.jpg", nil];
    
    _destinationDescriptions = [[NSMutableArray alloc] initWithObjects:@"Ofrecemos 16 zonas arqueológicas mayas con 4 estilos de arquitectura que son de gran relevancia histórica en nuestra región y patrimonio mixto.",@"Jalisco es uno de los estados, que junto con la Ciudad de México, conforman las treinta y dos entidades federativas de los Estados Unidos Mexicanos",@"Yucatán es uno de los treinta y un estados que, junto con la Ciudad de México, conforman las treinta y dos entidades federativas de los Estados Unidos Mexicanos. El estado se localiza en el sureste de México y en el norte de la península de Yucatán.",@"Chiapas, oficialmente llamado Estado Libre y Soberano de Chiapas, es una de las 32 entidades federativas de México. Se encuentra en el extremo sureste del país, en la frontera con Guatemala.",@"Nuevo León es uno de los treinta y un estados que, junto con la Ciudad de México conforman las treinta y dos entidades federativas de los Estados Unidos Mexicanos.", nil];
    
}

#pragma  mark - Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_destinationTitles count];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 210;
}

-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    //1. Setup the CATransform3D structure
    CATransform3D rotation;
    rotation = CATransform3DMakeRotation( (90.0*M_PI)/180, 0.0, 0.7, 0.4);
    rotation.m34 = 1.0/ -600;
    
    //2. Define the initial state (Before the animation)
    cell.layer.shadowColor = [[UIColor blackColor]CGColor];
    cell.layer.shadowOffset = CGSizeMake(10, 10);
    cell.alpha = 0;
    
    cell.layer.transform = rotation;
    cell.layer.anchorPoint = CGPointMake(0, 0.5);
    
    //3. Define the final state (After the animation) and commit the animation
    [UIView beginAnimations:@"rotation" context:NULL];
    [UIView setAnimationDuration:0.4];
    cell.layer.transform = CATransform3DIdentity;
    cell.alpha = 1;
    cell.layer.shadowOffset = CGSizeMake(0, 0);
    
    //Reassure that cell its in its place (WaGo)
    cell.frame = CGRectMake(0, cell.frame.origin.y, cell.frame.size.width, cell.frame.size.height);
    [UIView commitAnimations];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    cellHome *cell = (cellHome*)[tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    
    if (cell == nil) {
        
        [tableView registerNib:[UINib nibWithNibName:@"cellHome" bundle:nil] forCellReuseIdentifier:@"cellHome"];
        
        cell = [tableView dequeueReusableCellWithIdentifier:@"cellHome"];
    }
    
    cell.lblDestination.text = _destinationTitles[indexPath.row];
    cell.lblDescription.text = _destinationDescriptions[indexPath.row];
    cell.imgDestination.image = [UIImage imageNamed:_destinationImgs[indexPath.row]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _city = _destinationTitles[indexPath.row];
    
    [self performSegueWithIdentifier:@"Towns" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
   if([segue.destinationViewController isKindOfClass:[Towns class]]){
        
        Towns *destination = [segue destinationViewController];
       
        destination.key = _city;
        
    }
}


- (IBAction)logOut:(id)sender {
    [[Digits sharedInstance] logOut];
    sessionId = nil;
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
