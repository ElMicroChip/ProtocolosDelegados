//
//  FileDataAccess.h
//  ProtocolosDelegados
//
//  Created by Estudiante on 21/08/14.
//  Copyright (c) 2014 Diego Zapata Murillo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FileDataAccessDelegate.h"



@interface FileDataAccess : NSObject <NSURLConnectionDataDelegate>

@property id <FileDataAccessDelegate> iniciadox;



-(void) downloadFile:(NSString*)url andName:(NSString*)name;


+(NSString *)deleteFile:(NSString*)name;
@end
