//
//  Login.m
//  Lab05
//
//  Created by Luis de Jesus Martin Castillo on 09/07/16.
//  Copyright © 2016 Luis de Jesus Martin Castillo. All rights reserved.
//

#import "Login.h"
#import <DigitsKit/DigitsKit.h>

@interface Login ()

@end

@implementation Login

- (void)viewDidLoad {
    [super viewDidLoad];

    
    DGTAuthenticateButton *authButton;
    authButton = [DGTAuthenticateButton buttonWithAuthenticationCompletion:^(DGTSession *session, NSError *error) {
        
        if (session.userID) {
            
            sessionId = session.userID;            
            /*
          
            
            NSString *msg = [NSString stringWithFormat:@"Phone number: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"You are logged in!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];*/
            
           // [[Digits sharedInstance] logOut];
            
        } else if (error) {
            
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
   
    /*
    authButton.center = self.view.center;
    authButton.digitsAppearance = [self makeTheme];

    [self.view addSubview:authButton];*/
    
}

- (DGTAppearance *)makeTheme {
    DGTAppearance *theme = [[DGTAppearance alloc] init];
    theme.bodyFont = [UIFont fontWithName:@"Verdana" size:16];
    theme.labelFont = [UIFont fontWithName:@"Verdana" size:17];
    theme.accentColor = [UIColor colorWithRed:(33/255.0) green:(150/255.0) blue:(243/255.0) alpha:1];
    theme.backgroundColor = [UIColor colorWithRed:(245/255.0) green:(245/255.0) blue:(245/255.0) alpha:1];
    // TODO: Set a UIImage as a logo with theme.logoImage
    return theme;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewDidAppear:(BOOL)animated{
    if(sessionId){
         UIStoryboard *storyboard = self.storyboard;
         UIViewController *start =
         [storyboard instantiateViewControllerWithIdentifier:@"Start"];
         UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:start];
         
         [self presentViewController:nav animated:NO completion:NULL];
    }
   
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)test:(id)sender {
    [[Digits sharedInstance] authenticateWithCompletion:^(DGTSession *session, NSError *error) {
        if (session.userID) {
            sessionId = session.userID;
            
            NSString *msg = [NSString stringWithFormat:@"Tu número es: %@", session.phoneNumber];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"¡Bienvenido!"
                                                            message:msg
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            [alert show];
            
            [self viewDidAppear:YES];
            
        }else{
            NSLog(@"Authentication error: %@", error.localizedDescription);
        }
    }];
    
}
@end
