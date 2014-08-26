//
//  FileDataAccessDelegate.h
//  ProtocolosDelegados
//
//  Created by Estudiante on 21/08/14.
//  Copyright (c) 2014 Diego Zapata Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol FileDataAccessDelegate <NSObject>



@required
//Metodo cuando crea el archivo de   descarga. Parametros: ruta y nombre del archivo

-(void)downloadFinishLoading:(NSString*)filepath andName:(NSString*)name;

//metodo cuando finaliza la descarga en memoria

-(void)downloadFinishLoading:(NSString*)name;

//metodo que inciia  la descarga
-(void)downloadInitLoading:(NSURLConnection*)connection didReceiveResponse:(NSURLResponse*)response;




@optional

//metodo cuando encuentra error la conex.

-(void)downloadFinishLoading:(NSURLConnection*)connection didFailWithError:(NSError*)error andName:(NSString*)name;

//metodo cuando esta descargando en memoria
-(void)downloadChangeLoading:(NSURLConnection*)connection didreceiveData:(NSData*)data andProgress:(float)progress;


@end
