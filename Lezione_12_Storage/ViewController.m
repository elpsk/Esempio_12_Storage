//
//  ViewController.m
//  Lezione_12_Storage
//
//  Created by Alberto Pasca on 16/11/11.
//  Copyright (c) 2011 Cutaway SRL. All rights reserved.
//

#import "ViewController.h"
#import "Settings.h"

@implementation ViewController

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void) LimitExecution {
  
  // -------------------------------
  // Carico il contatore dal disco
  // -------------------------------  
  NSUserDefaults *retrieve = [NSUserDefaults standardUserDefaults];
  int data = [[retrieve stringForKey:@"EXECUTIONS"] intValue];
  NSLog(@"COUNTER: %d", data);
  
  // -------------------------------
  // Faccio un +1 e lo sovrascrivo
  // -------------------------------
  NSUserDefaults *store = [NSUserDefaults standardUserDefaults];
  [store setObject:[NSNumber numberWithInt:++data] forKey:@"EXECUTIONS"];
  
}

- (void) ReadWritePLIST {

  // -------------------------------
  // PLIST Custom. TestPlist.plist
  // -------------------------------
  NSString *plistPath = [[NSBundle mainBundle] pathForResource:@"TestPlist" ofType:@"plist"];
  NSLog(@"PATH: %@", plistPath);
  NSDictionary *contentArray = [NSDictionary dictionaryWithContentsOfFile:plistPath];
  NSLog(@"DICTIONARY: %@", contentArray);
  NSLog(@"VALORE: %@", [contentArray objectForKey:@"primo"]);
  

  // -------------------------------
  // PLIST di default. Info.plist
  // -------------------------------
  NSBundle* mainBundle = [NSBundle mainBundle];
  NSLog(@"%@", [mainBundle objectForInfoDictionaryKey:@"CFBundleIdentifier"]);
  NSLog(@"%@", [mainBundle bundleIdentifier]);
  NSLog(@"%@", [mainBundle objectForInfoDictionaryKey:@"CFBundleVersion"]);

  
  // -------------------------------
  // PLIST Custom. In un file .BUNDLE
  // -------------------------------
  NSString *BundlePath = [[NSBundle mainBundle] pathForResource:@"Test" ofType:@"bundle"];
  NSBundle *FileBundle = [NSBundle bundleWithPath:BundlePath];
  NSString *plistInBundle = [FileBundle  pathForResource:@"PLISTinBundle" ofType:@"plist"];
  NSLog(@"%@", FileBundle );
  NSLog(@"%@", plistInBundle);
  NSDictionary *content = [NSDictionary dictionaryWithContentsOfFile:plistInBundle];
  NSLog(@"DICTIONARY: %@", content);
  
  
}

- (void) ReadWriteSETTINGS {

  // -------------------------------
  // Write MaxPoints to SETTINGS Label
  // -------------------------------
  NSUserDefaults *standardUserDefaults = [NSUserDefaults standardUserDefaults];
	if (standardUserDefaults) {
		[standardUserDefaults setObject:[NSNumber numberWithInt:12345] forKey:@"MaxPoints"];
		[standardUserDefaults synchronize];
	}

  // -------------------------------
  // Get
  // -------------------------------
  NSLog(@"MaxPoints   : %@", [standardUserDefaults  objectForKey:@"MaxPoints"]);
  NSLog(@"Facebook    : %@", [[standardUserDefaults objectForKey:@"facebook"] intValue] == 0 ? @"Disattivato" : @"Attivato" );
  NSLog(@"Game Center : %@", [[standardUserDefaults objectForKey:@"game_center"] intValue] == 0 ? @"Disattivato" : @"Attivato" );

}

- (void) SaveClassToStorage {
  
  //
  // creo la classe, normalmente
  //
  Settings *set = [[Settings alloc] init];
  set.Messaggio = @"My Custom Message";
  set.Raggio    = 2810;
  set.Stato     = NO;
  set.Suoneria  = @"acdc-thundertruck.mp3";

  //
  // trovo la cartella Documenti nel .APP
  //
  NSArray *documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *path = nil;
 	if (documentDir) path = [documentDir objectAtIndex:0];  
  path = [NSString stringWithFormat:@"%@/%@", path, @"data.bin"];

  //
  // SALVO l'archivio su disco
  //
  [NSKeyedArchiver archiveRootObject:set toFile:path];
  
  [set release];

}
- (void) ReadClassFromStorage {

  //
  // trovo la cartella Documenti nel .APP
  //
  NSArray *documentDir = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *path = nil;
 	if (documentDir) path = [documentDir objectAtIndex:0];  
  path = [NSString stringWithFormat:@"%@/%@", path, @"data.bin"];

  //
  // CREO LA CLASSE CON QUELLO CHE C'E' SU FILE !!!
  //
  Settings *loaded = [NSKeyedUnarchiver unarchiveObjectWithFile:path];
  if ( loaded ) {
    NSLog(@"**** DATA LOADED *****");
    NSLog(@"Messaggio: %@", loaded.Messaggio);
    NSLog(@"Suoneria : %@", loaded.Suoneria);
    NSLog(@"Stato    : %d", loaded.Stato);
    NSLog(@"Raggio   : %d", loaded.Raggio);
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];

//  [self LimitExecution];
  
//  [self ReadWritePLIST];
  
//  [self ReadWriteSETTINGS];
  
//  [self ReadClassFromStorage];
//  [self SaveClassToStorage];
  
}
- (void)viewDidUnload {
  [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];
}
- (void)viewDidAppear:(BOOL)animated {
  [super viewDidAppear:animated];
}
- (void)viewWillDisappear:(BOOL)animated {
	[super viewWillDisappear:animated];
}
- (void)viewDidDisappear:(BOOL)animated {
	[super viewDidDisappear:animated];
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
