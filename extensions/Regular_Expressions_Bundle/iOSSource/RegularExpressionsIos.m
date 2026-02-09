
#import "RegularExpressionsIos.h"
@implementation RegularExpressionsIos

-(double) IsMatch :(char *) inputstring andPattern:(char *) patter{
    
    NSString *searchedString = [NSString stringWithUTF8String:inputstring];
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = [NSString stringWithUTF8String:patter];
    NSError  *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
    
    if (matches.count>0) {
        return 1;
    }else{
        
        return 0;
    }
    
}
-(NSString* )Search:(char * )inputstring andPattern:(char *)patter andSepareter:(char *) separ{
    
    NSString *searchedString = [NSString stringWithUTF8String:inputstring];
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = [NSString stringWithUTF8String:patter];
    NSString * separetar=[NSString stringWithUTF8String:separ];
    NSMutableString* newString=[NSMutableString new];
    
    NSError  *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
    
    for (NSTextCheckingResult* match in matches) {
        NSString* matchText = [searchedString substringWithRange:[match range]];
        [newString appendString:matchText];
        [newString appendString:separetar];
    }
    NSString * returnedString=newString;
    if (returnedString.length>0) {
        returnedString=[returnedString substringToIndex:returnedString.length-1];
    }
    return returnedString;
}

-(NSString* )ReplaceAll:(char *) inputstring andPattern:(char *) patter andReplacement:(char *) replacement{
    
    NSString *searchedString = [NSString stringWithUTF8String:inputstring];
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = [NSString stringWithUTF8String:patter];
    NSString * replacementString=[NSString stringWithUTF8String:replacement];
    NSMutableString* newString=[NSMutableString stringWithString:searchedString];
    
    NSError  *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
    NSMutableArray *matchTexts=[[NSMutableArray alloc]init];
   
    for (NSTextCheckingResult* match in [matches reverseObjectEnumerator]) {
       
        NSString* matchText = [searchedString substringWithRange:[match range]];
        [matchTexts addObject:matchText];
    }
    for(int i=0;i<[matchTexts count];i++)
    {
        NSString *matchText = [matchTexts objectAtIndex:i];
        [newString replaceOccurrencesOfString:matchText withString:replacementString options:0 range:searchedRange];
    }
   
    return newString;
}
-(NSString* )ReplaceFirst:(char *) inputstring andPattern:(char *) patter andReplacement:(char *) replacement{
    
    NSString *searchedString = [NSString stringWithUTF8String:inputstring];
    NSRange   searchedRange = NSMakeRange(0, [searchedString length]);
    NSString *pattern = [NSString stringWithUTF8String:patter];
    NSString * replacementString=[NSString stringWithUTF8String:replacement];
    NSString* newString=[NSString stringWithString:searchedString];
    
    NSError  *error = nil;
    
    NSRegularExpression* regex = [NSRegularExpression regularExpressionWithPattern: pattern options:0 error:&error];
    NSArray* matches = [regex matchesInString:searchedString options:0 range: searchedRange];
    
    for (NSTextCheckingResult* match in matches) {
        
        NSString* matchText = [searchedString substringWithRange:[match range]];
        
        NSRange rOriginal = [searchedString rangeOfString: matchText];
        
        if (NSNotFound != rOriginal.location) {
            newString = [newString
                         stringByReplacingCharactersInRange: rOriginal
                         withString:                         replacementString];
			break;
        }
    }
    return newString;
}

@end