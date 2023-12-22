package ${YYAndroidPackageName};

import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class RegularExpressionsAndroid {

    // Parameters:
    //  s = input string
    //  p = regex pattern
    public double IsMatch(String s, String p) {
        Pattern pattern = Pattern.compile(p);
        Matcher matcher = pattern.matcher(s);
        return (matcher.matches()) ? 1 : 0;
    }
    
    // Parameters:
    //	s = input string
    //	p = regex pattern
    //	sep = separator character
    public String Search(String s, String p, String sep) {
    	Pattern pattern = Pattern.compile(p);
    	Matcher matcher = pattern.matcher(s);
    	String output = "";
    	while(matcher.find()) {
    		output += matcher.group() + sep;
    	}
    	if(output.length() > 1)
    		output = output.substring(0, output.length() - 1);
    	return output;
    }

    // Parameters:
    //	s = input string
    //	p = regex pattern
    //	r = replacement string
    public String ReplaceAll(String s, String p, String r) {
    	Pattern pattern = Pattern.compile(p);
    	Matcher matcher = pattern.matcher(s);
    	return matcher.replaceAll(r);
    }

    // Parameters:
    //	s = input string
    //	p = regex pattern
    //	r = replacement string
    public String ReplaceFirst(String s, String p, String r) {
    	Pattern pattern = Pattern.compile(p);
    	Matcher matcher = pattern.matcher(s);
    	return matcher.replaceFirst(r);
    }
}