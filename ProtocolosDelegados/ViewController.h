//
//  ViewController.h
//  ProtocolosDelegados
//
//  Created by Estudiante on 21/08/14.
//  Copyright (c) 2014 Diego Zapata Murillo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FileDataAccess.h"


@interface ViewController : UIViewController <FileDataAccessDelegate>

@property (strong, nonatomic) IBOutlet UITextField *UrlUsuario;
@property (strong, nonatomic) IBOutlet UITextField *nombreUsuario;
@property (strong, nonatomic) IBOutlet UIImageView *imagenVista;

@property (strong, nonatomic) IBOutlet UIProgressView *progressBar;


@property (strong, nonatomic) IBOutlet UILabel *salidaUsuario;


- (IBAction)deleteButton:(id)sender;


- (IBAction)downloadButton:(id)sender;


@end
