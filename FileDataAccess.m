//
//  FileDataAccess.m
//  ProtocolosDelegados
//
//  Created by Estudiante on 21/08/14.
//  Copyright (c) 2014 Diego Zapata Murillo. All rights reserved.
//

#import "FileDataAccess.h"

@interface FileDataAccess()
@property long long expectedLength;
@property NSMutableData * fileData;
@property NSString * fileName;

@end


@implementation FileDataAccess

float progress = 0.0f;

//Metodos del connectionDataDelegado

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    progress = 0;
    _expectedLength = [response expectedContentLength];
    
    
    [self.iniciadox downloadInitLoading:connection didReceiveResponse:response];
    
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    progress += [data length];
    [_fileData appendData:data];
    
    [self.iniciadox downloadChangeLoading:connection didreceiveData:data andProgress:(progress/(float)_expectedLength)];

}
      -(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *) error {
          
          [self.iniciadox downloadFinishLoading:connection didFailWithError:error andName:_fileName];
          
      }
      -(void)connectionDidFinishLoading:(NSURLConnection *)connection{
          [self.iniciadox downloadFinishLoading:_fileName];
          
          //metodo para almacenar las iamgenes
          
          [self saveDocuments:_fileData andName:_fileName];
      }



//metodos decladados en  el .h
-(void) downloadFile:(NSString*)url andName:(NSString *)name{
    _fileName=name;
    _fileData = [[NSMutableData alloc]init];
    NSURL * urlData = [NSURL URLWithString:url];
    NSURLRequest * request = [NSURLRequest requestWithURL:urlData];
    NSURLConnection * connection =  [[NSURLConnection alloc] initWithRequest:request delegate:self];
    [connection start];
    
}
//Metodos Propios de la  clase FileDataAccess

-(void)saveDocuments:(NSData*)imageData andName:(NSString*)name{
    NSArray * paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString * folderPath = [[paths lastObject] stringByAppendingPathComponent:@"imagenes"];
    BOOL isDir = NO;
    NSFileManager * file = [[NSFileManager alloc]init];
    if (![file fileExistsAtPath:folderPath isDirectory:&isDir] && isDir == NO){
        [file createDirectoryAtPath:folderPath withIntermediateDirectories:NO attributes:nil error:nil];
    }
    NSString * imagePath = [folderPath stringByAppendingPathComponent:name];
    NSError * error = nil;
    [imageData writeToFile:imagePath options:NSDataWritingAtomic error:&error];
    
    if (error){
        NSLog(@"Error en crear archivo: %@", error);
    }else{
        [self.iniciadox downloadFinishLoading:imagePath andName:_fileName];
    }
    
   
    
    
}

+(NSString *)

@end
