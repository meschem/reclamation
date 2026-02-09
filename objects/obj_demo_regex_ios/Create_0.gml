/// @description  iOS Regular Expressions Demo
if(os_type == os_ios) {
    // iOS
    show_message("Regular Expressions (iOS) - demo.");
    
    // Demo all regex functions
    var phrase = "The quick brown fox jumps over the lazy dog";
    var ismatch1 = regex_ios_matches("test", "[a-z]{3,5}");
    var ismatch2 = regex_ios_matches("myemail@domain.com", "^[a-zA-Z0-9\\-_]+@[a-zA-Z0-9\\-]+\\.([a-z]{3}|[a-z]{2,3}.[a-z]{2,3})$");
    var search = regex_ios_search(phrase, "\\b[a-z]{4,}", "|");
    var replace_all = regex_ios_replace_all(phrase, "\\b[a-z]{3,4}\\b\\s{1}", "something ");
    var replace_all2 = regex_ios_replace_all(phrase, "^\\s*\\b[a-zA-Z]+\\b", "The not so");
    var replace_first = regex_ios_replace_first(phrase, "\\b[a-z]{3}\\b", "sloth");
    
    // Result string
    var ismatch_m;
    
    // ismatch1
    if(ismatch1) ismatch_m = "Yes!";
    else ismatch_m = "No!";
    show_message("Does 'test' match regex '[a-z]{3,5}'?##" + ismatch_m);
    
    // ismatch2
    if(ismatch2) ismatch_m = "Yes!";
    else ismatch_m = "No!";
    show_message("Does 'myemail@domain.com' match regex '^[a-zA-Z0-9\\-_]+@[a-zA-Z0-9\\-]+\\.([a-z]{3}|[a-z]{2,3}[a-z]{2,3})$'?##" + ismatch_m);
    
    // search
    show_message("Searching for regex '\\b[a-z]{4,}' in string '" + phrase + "'.##Result: " + search);
    
    // replace_all
    show_message("Replacing all occurrences of regex '\\b[a-z]{3,4}\\s' in string '" + phrase + "' with 'something '.##Result: " + replace_all);
    
    // replace_all2
    show_message("Replacing all occurrences of regex '^\\s*\\b[a-zA-Z]+\\b' in string '" + phrase + "' with 'The not so'.##Result: " + replace_all2);
    
    // replace_first
    show_message("Replacing first occurrence of regex '\\b[a-z]{3}\\b' in string '" + phrase + "' with 'sloth'.##Result: " + replace_first);
    
    // Demo has ended
    show_message("Demo has ended.");
}

