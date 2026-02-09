@interface RegularExpressionsIos : NSObject
-(double) IsMatch :(char *) inputstring andPattern:(char *) patter;
-(NSString* )Search:(char * )inputstring andPattern:(char *)patter andSepareter:(char *) separ;
-(NSString* )ReplaceAll:(char *) inputstring andPattern:(char *) patter andReplacement:(char *) replacement;
-(NSString* )ReplaceFirst:(char *) inputstring andPattern:(char *) patter andReplacement:(char *) replacement;
@end
