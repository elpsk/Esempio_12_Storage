//
//  Settings.m
//  Tuttocitta
//
//  Created by Alberto Pasca on 27/10/11.
//  Copyright (c) 2011 SEAT Pagine Gialle. All rights reserved.
//

#import "Settings.h"

@implementation Settings

@synthesize Raggio=_Raggio, Stato=_Stato, Messaggio=_Messaggio, Suoneria=_Suoneria;

- (id) init {
  return [super init];
}

- (id) initWithCoder: (NSCoder *)decoder 
{
  if (self = [super init]) {
    self.Messaggio       = [decoder  decodeObjectForKey:@"Messaggio"];
    self.Raggio          = [[decoder decodeObjectForKey:@"Raggio"] intValue];
    self.Stato           = [[decoder decodeObjectForKey:@"Stato"] boolValue];
    self.Suoneria        = [decoder  decodeObjectForKey:@"Suoneria"];
  }
  return self;
}

- (void) encodeWithCoder: (NSCoder *)coder 
{  
  [coder encodeObject:self.Messaggio forKey:@"Messaggio"];
  [coder encodeObject:[NSNumber numberWithInt:self.Raggio] forKey:@"Raggio"];
  [coder encodeObject:[NSNumber numberWithBool:self.Stato] forKey:@"Stato"];
  [coder encodeObject:self.Suoneria forKey:@"Suoneria"];
}

- (void) dealloc {
  [_Messaggio release];
  [_Suoneria  release];
  [super dealloc];
}

@end
