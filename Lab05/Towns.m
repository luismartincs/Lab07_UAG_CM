//
//  Towns.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 27/06/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Towns.h"
#import "cellHome.h"
#import "Details.h"


@interface Towns ()
    @property NSDictionary *towns;
    @property NSDictionary *townsImgs;
    @property NSDictionary *townsDesc;
    @property NSInteger index;

@end

@implementation Towns

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initController];
}

-(void)viewWillAppear:(BOOL)animated{
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    [tracker set:kGAIScreenName value:_key];
    [tracker send:[[GAIDictionaryBuilder createScreenView] build]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - init

-(void)initController{
    
    [self setTitle:_key];
    
    _towns = @{
               @"Campeche":@[@"San Francisco de Campeche",@"Ciudad del Carmen",@"Champotón",@"Palizada",@"Xpujil"],
               @"Jalisco":@[@"Puerto Vallarta",@"Guadalajara",@"Tequila",@"Degollado",@"Mazamitla"],
               @"Yucatán":@[@"Mérida",@"Valladolid",@"Progreso",@"Izamal",@"Tizimín"],
               @"Chiapas":@[@"San Cristóbal de Las Casas",@"Palenque",@"Tuxtla Gutiérrez",@"Tapachula",@"Chiapa de Corzo"],
               @"Nuevo León":@[@"Monterrey",@"Santiago",@"Bustamante",@"Montemorelos",@"Galeana"],
               };
    
    _townsImgs = @{
               @"Campeche":@[@"c1.jpg",@"c2.jpg",@"c3.jpg",@"c4.jpg",@"c5.jpg"],
               @"Jalisco":@[@"j1.jpg",@"j2.jpg",@"j3.jpg",@"j4.jpg",@"j5.jpg"],
               @"Yucatán":@[@"y1.jpg",@"y2.jpg",@"y3.jpg",@"y4.jpeg",@"y5.jpg"],
               @"Chiapas":@[@"ch1.jpg",@"ch2.jpg",@"ch3.jpg",@"ch4.jpeg",@"ch5.jpg"],
               @"Nuevo León":@[@"m1.jpg",@"m2.jpg",@"m3.jpg",@"m4.jpg",@"m5.jpg"],
               
               };

    
    _townsDesc = @{
                   @"Campeche":@[@"San Francisco de Campeche es la capital del estado mexicano de Campeche y cabecera del municipio del mismo nombre. Es una ciudad histórica fortificada ubicada a orillas del golfo de México, en la península de Yucatán.",@"Ciudad del Carmen es la cabecera del municipio de Carmen, Campeche. Se localiza al suroeste de la península de Yucatán, en la parte occidente de la Isla del Carmen, está situada entre el Golfo de México y la Laguna de Términos.",@"Champotón es una localidad del estado de Campeche en México, está localizada al sur de la capital del estado y es cabecera del Municipio de Champotón.",@"Palizada es una localidad del estado mexicano de Campeche, cabecera del municipio de Palizada; está localizada al suroeste del estado, en la región de los ríos, cercana a la Laguna de Términos.",@"Xpujil es una población del estado mexicano de Campeche, localizada en el sureste del estado, en medio de la selva. Es cabecera del Municipio de Calakmul."],
                   
                   @"Jalisco":@[@"Puerto Vallarta es una ciudad y uno de los 125 municipios del estado de Jalisco, México. En el 2005, el municipio contaba con una población estimada de 307,107 personas, así como cinco millones de turistas anuales.",@"Guadalajara es una ciudad y municipio mexicano, capital y urbe más poblada del estado de Jalisco. Se localiza en el occidente de México, al centro de Jalisco, en la zona geográfica conocida como Valle de Atemajac.",@"Tequila es un municipio y un poblado del estado de Jalisco, en México. El nombre de Tequila proviene de la palabra náhuatl Tekilan,. Es un \"pueblo mágico\".",@"Degollado es un municipio del Estado de Jalisco. Se encuentra ubicado al sureste de la Región de los Altos, por lo que se le conoce como \"la puerta grande de Los Altos de Jalisco\".",@"Mazamitla es un municipio y población del estado de Jalisco, México. Se localiza 124 km al sur de Guadalajara en la Región Sureste. Su nombre proviene del náhuatl y significa \"Lugar donde se cazan los venados con flechas\"."],
                   
                   @"Yucatán":@[@"Mérida es la capital y ciudad más poblada del estado de Yucatán, México. Está ubicada en el municipio homónimo que se encuentra en la Zona Influencia Metropolitana o Región VI de la entidad.",@"Valladolid es una ciudad yucateca ubicada en el municipio del mismo nombre, el cual se encuentra en la región II de Yucatán.",@"Progreso de Castro es una localidad con la categoría de ciudad ubicada en el estado mexicano de Yucatán, específicamente en el municipio homónimo que se encuentra en la zona de influencia metropolitana ó Región VI del mismo estado.",@"Izamal es una ciudad mexicana, cabecera del municipio del mismo nombre en el Estado de Yucatán. Izamal se ubica a 66.5 kilómetros al este de Mérida y a unos 60 kilómetros al noroeste de Chichén Itzá.",@"Tizimín es una localidad yucateca ubicada en el municipio del mismo nombre, el cual se encuentra en la región noreste de Yucatán."],
                   
                   
                   @"Chiapas":@[@"San Cristóbal de Las Casas es la cabecera del municipio homónimo en el centro del estado de Chiapas.",@"Palenque es una ciudad del estado mexicano de Chiapas. La ciudad de Palenque es una ciudad de origen maya ubicada en el estado mexicano de Chiapas, cerca del río Usumacinta, y cuyo principal atractivo turístico es la zona arqueológica de Palenque.",@"Tuxtla Gutiérrez es una ciudad y municipio mexicano, capital y núcleo urbano más grande del estado de Chiapas.",@"Tapachula es una ciudad mexicana en el estado de Chiapas. Se encuentra en la Región del Soconusco. Se encuentra en la Costa Sur de Chiapas, limita al norte con Motozintla, al este con Cacahoatán, Tuxtla.",@"Chiapa de Corzo es una pequeña ciudad mexicana situada en el centro del estado de Chiapas, en el sureste de México. Se localiza a 15 km del centro de Tuxtla Gutiérrez."],
                   
                   @"Nuevo León":@[@"Monterrey es una ciudad y municipio mexicano, capital y ciudad más poblada del estado de Nuevo León y la tercera más importante de México.",@"Santiago es la cabecera del municipio del mismo nombre en el estado de Nuevo León en México.",@"Bustamante es un municipio de México en el estado de Nuevo León. Lleva el nombre de Bustamante, aunque en su fundación tenía por nombre San Miguel de Aguayo de la Nueva Tlaxcala. El Municipio tiene una extensión territorial de 558 km².",@"Montemorelos es una pequeña ciudad mexicana cabecera del municipio homónimo, en el estado de Nuevo León. Se encuentra a 342 msnm, en la margen izquierda del río Pilón, a 82 km al sureste de Monterrey. En 2005, la población fue de 53.854 habitantes.",@"Galeana es un municipio del estado mexicano de Nuevo León. Cuenta con una extensión territoral de 7.154,6 km²; Siendo el más grande en extension territorial en el estado."],
                   
                   };

}

#pragma  mark - Delegates

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [[_towns objectForKey:_key] count];
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
    
    cell.lblDestination.text = [_towns objectForKey:_key][indexPath.row];
    cell.lblDescription.text = [_townsDesc objectForKey:_key][indexPath.row];
    cell.imgDestination.image = [UIImage imageNamed:[_townsImgs objectForKey:_key][indexPath.row]];
    
    return cell;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    _index = indexPath.row;
    
    [self performSegueWithIdentifier:@"Details" sender:self];
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if([segue.destinationViewController isKindOfClass:[Details class]]){
        
        Details *destination = [segue destinationViewController];
        
        destination.destinationTitle = [_towns objectForKey:_key][_index];
        destination.destinationDescription = [_townsDesc objectForKey:_key][_index];
        destination.destinationPhoto = [_townsImgs objectForKey:_key][_index];
        destination.city = _key;
        
    }
}

@end
