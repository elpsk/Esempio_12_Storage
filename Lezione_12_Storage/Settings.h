//
//  Settings.h
//  Tuttocitta
//
//  Created by Alberto Pasca on 27/10/11.
//  Copyright (c) 2011 SEAT Pagine Gialle. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Settings : NSObject <NSCoding> 
{  
  BOOL _Stato;  
  NSString *_Messaggio;
  NSString *_Suoneria;
  int _Raggio;
}

@property (nonatomic, assign) BOOL Stato;
@property (nonatomic, assign) int Raggio;
@property (nonatomic, retain) NSString *Messaggio;
@property (nonatomic, retain) NSString *Suoneria;

@end
