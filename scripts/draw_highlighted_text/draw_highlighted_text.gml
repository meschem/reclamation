/// @function script_draw_highlighted_text(x, y, text, max_width, color_map_struct, line_height, default_color)
// Draws text that is parsed for pipe-enclosed keywords and respects a max width.
function draw_highlighted_text(_x, _y, _text, _max_width, _color_map_struct, _line_height, _default_color)
{
    // The core idea is to first split the text into lines (wrapping)
    // and then draw each line by segment (highlighting).
    
    // --- 1. Line Wrapping & Parsing ---
    
    // Split the entire string by the pipe character (the delimiter)
    var _initial_segments = string_split(_text, "|");
    
    // An array to hold the final wrapped lines, where each line is an array 
    // of segment structs: [{text: "...", color: c_...}, ...]
    var _wrapped_lines = [];
    var _current_line_segments = [];
    var _current_line_width = 0;
    
    // Iterate through the raw segments (normal text and keywords)
    for (var i = 0; i < array_length(_initial_segments); i++)
    {
        var _segment_text = _initial_segments[i];
        var _is_keyword = i % 2 != 0; // Odd indices are keywords
        
        // Determine the segment's color
        var _segment_color = _default_color;
        if (_is_keyword)
        {
            // Try to look up the color in the struct using the keyword string
            _segment_color = variable_struct_get(_color_map_struct, _segment_text) ?? _default_color;
        }

        // --- Handle Wrapping within the Segment ---
        
        // This is a complex part: we wrap *within* the segment's text
        var _words = string_split(_segment_text, " ");
        
        for (var j = 0; j < array_length(_words); j++)
        {
            var _word = _words[j];
            var _word_width = string_width(_word);
            
            // Check if the word (plus a potential space) exceeds the max width
            var _space_width = j == 0 ? 0 : string_width(" ");
            var _next_width = _current_line_width + _space_width + _word_width;
            
            if (_next_width > _max_width)
            {
                // New Line: Push the current accumulated line segments
                array_push(_wrapped_lines, _current_line_segments);
                
                // Reset for the new line
                _current_line_segments = [];
                _current_line_width = 0;
            }
            
            // Append the word to the current line's segments
            var _segment_to_add = undefined;
            if (array_length(_current_line_segments) > 0)
            {
                // Try to append to the last segment if colors match
                var _last_segment = _current_line_segments[array_length(_current_line_segments) - 1];
                if (_last_segment.color == _segment_color)
                {
                    _last_segment.text += (j == 0 && _current_line_width != 0) ? (" " + _word) : _word;
                    _segment_to_add = _last_segment;
                }
            }
            
            // If we couldn't merge, create a new segment
            if (is_undefined(_segment_to_add))
            {
                _segment_to_add = { 
                    text: (j == 0 && _current_line_width != 0) ? (" " + _word) : _word, 
                    color: _segment_color 
                };
                array_push(_current_line_segments, _segment_to_add);
            }
            
            // Update the width tracker
            _current_line_width = string_width(string_join(_current_line_segments, " "));
        }
    }
    
    // Push the final remaining line
    if (array_length(_current_line_segments) > 0)
    {
        array_push(_wrapped_lines, _current_line_segments);
    }
    
    // --- 2. Drawing ---
    
    var _current_y = _y;
    
    // Iterate through all the wrapped lines
    for (var k = 0; k < array_length(_wrapped_lines); k++)
    {
        var _line_segments = _wrapped_lines[k];
        var _current_x = _x;
        
        // Draw the segments for this single line
        for (var l = 0; l < array_length(_line_segments); l++)
        {
            var _segment = _line_segments[l];
            
            draw_set_color(_segment.color);
            draw_text(_current_x, _current_y, _segment.text);
            
            // Advance the x position for the next segment
            _current_x += string_width(_segment.text);
        }
        
        // Advance the y position for the next line
        _current_y += _line_height;
    }
    
    // Reset the color after drawing
    draw_set_color(c_white);
}