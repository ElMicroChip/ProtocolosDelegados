//
//  ViewController.m
//  ProtocolosDelegados
//
//  Created by Estudiante on 21/08/14.
//  Copyright (c) 2014 Diego Zapata Murillo. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    FileDataAccess * file = [[FileDataAccess alloc] init];
    [file downloadFile:@"http://2.bp.blogspot.com/_EZ16vWYvHHg/S-Bl2fuyyWI/AAAAAAAAMKc/DNayYJK8mEo/s1600/www.BancodeImagenesGratuitas.com-Fantasticas-20.jpg" andName:@"foto.jpg"];
    file.iniciadox = self;

}
-(void)downloadInitLoading:(NSURLConnection *)connection didReceiveResponse: (NSURLResponse *)response {
    NSLog(@"Iniciando descarga");
}
  
  
  -(void)downloadFinishLoading:(NSString *)filepath andName:(NSString *)name {
      
      
      NSLog(@"terminada y finiquitada");
      NSData * infoImage = [NSData dataWithContentsOfFile:filepath];
      _imagenVista.image = [UIImage imageWithData:infoImage];

  }





  -(void)downloadFinishLoading:(NSString *)name {
      NSLog(@"Termino descarga en memoria");
  }
-(void)downloadChangeLoading:(NSURLConnection *)connection didreceiveData:(NSData *)data andProgress:(float)progress{
      NSLog(@"%f",progress*100);

}
  
  -(void)downloadFinishLoading:(NSURLConnection *)connection didFailWithError:(NSError *)error andName:(NSString *)name {
      NSLog(@"%@",error);
  }


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)deleteButton:(id)sender {
}

- (IBAction)downloadButton:(id)sender {
}
@end
