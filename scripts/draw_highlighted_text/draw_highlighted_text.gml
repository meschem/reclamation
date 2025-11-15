///@description								Draws text with highlighted keywords
///@param {real} _x							X Position
///@param {real} _y							Y Position
///@param {string} _text					Text to draw
///@param {real} _maxWidth					Width of the text block to start wrapping
///@param {struct} _colorMapStruct			Color map struct to use
///@param {real} _lineHeight				Line height to use
///@param {constant.Color} _defaultColor	Default color if not white
function draw_highlighted_text(_x, _y, _text, _maxWidth, _colorMapStruct, _lineHeight, _defaultColor = c_white) {
    // --- Line Wrapping & Parsing ---
    
    // Split the entire string by the pipe character (the delimiter)
	if (string_pos(_text, "#") != 0) {
		show_message("Hashtag found in string, illegal for highlight draws")
	}
	var _convertedString = string_replace_all(_text, "\n", "#\n#")
    var _initialSegments = string_split(_convertedString, "|")
	var _testString = "test"
    
    // An array to hold the final wrapped lines, where each line is an array 
    // of segment structs: [{text: "...", color: c_...}, ...]
    var _wrappedLines = []
    var _currentLineSegments = []
    var _currentLineWidth = 0
	var _spaceTextWidth = string_width(" ")
	var _addingSpace = false
	var _newLine = false
	
	//show_message(_initialSegments)
    
    // Iterate through the raw segments (normal text and keywords)
    for (var i = 0; i < array_length(_initialSegments); i++) {
        var _segmentText = _initialSegments[i]
        var _isKeyword = i % 2 != 0
        
        var _segmentColor = _defaultColor
        if (_isKeyword) {
            // Color lookup
            _segmentColor = variable_struct_get(_colorMapStruct, _segmentText) ?? _defaultColor
			_segmentText = string_replace_all(_segmentText, "_", " ")
        }

        // --- Handle Wrapping within the Segment ---
        var _words = string_split_ext(_segmentText, [" ", "#"]) //, "\n"])
		
		//show_message(_words)
      
        for (var j = 0; j < array_length(_words); j++) {
            var _word = _words[j]
            var _wordWidth = string_width(_word)
			
			if (_word == "\n") {
				array_push(_wrappedLines, _currentLineSegments)
                
                // Reset line
                _currentLineSegments = []
                _currentLineWidth = 0
				
				_addingSpace = false
				_newLine = true
				
				continue
			}
			
			// Are we adding a space BEFORE the word?
			_addingSpace = false
			
			if (
				!_isKeyword &&
				!_newLine
			) {
				if ((j > 1 && _word != "")) {				
					_addingSpace = true
				}
			}

            var _nextWidth = _currentLineWidth + _wordWidth
			if (_addingSpace) _nextWidth += _spaceTextWidth
			
			//show_message([
			//	_word,
			//	_wordWidth,
			//	_nextWidth
			//])
            
            if (_nextWidth > _maxWidth) {
                array_push(_wrappedLines, _currentLineSegments)
                
                // Reset line
                _currentLineSegments = []
                _currentLineWidth = 0
				
				_addingSpace = false
				_newLine = true
            } else {
				_newLine = false
			}
            
            // Append the word to the current line's segments
            var _segmentToAdd = undefined
			
            if (array_length(_currentLineSegments) > 0) {
                // Try to append to the last segment if colors match
                var _lastSegment = _currentLineSegments[array_length(_currentLineSegments) - 1]
				
                if (_lastSegment.color == _segmentColor)
                {
                    _lastSegment.text += (j > 0) ? (" " + _word) : _word
                    _segmentToAdd = _lastSegment
                }
				
            }
            
            // If not merging, create new segment
            if (is_undefined(_segmentToAdd)) {
				var _segTxt = (_addingSpace) ? " " + _word : _word
                _segmentToAdd = { 
                    text: _segTxt, 
                    color: _segmentColor 
                }
                array_push(_currentLineSegments, _segmentToAdd)
				
				//show_message("UNDEFINED seg to add: " + _segmentToAdd.text + ", SHOULD BE: " + _word)
				
            }
            
			_currentLineWidth += string_width(_word)
			
			if (_addingSpace) _currentLineWidth += _spaceTextWidth
        }
    }
    
    // Push the final remaining line
    if (array_length(_currentLineSegments) > 0) {
        array_push(_wrappedLines, _currentLineSegments)
    }
    
    // --- Drawing ---
	// Need to move this to its own function that can grab above struct(s)
    
    var _currentY = _y
	
	//show_message(_wrappedLines)
    
    // Iterate through all the wrapped lines
    for (var k = 0; k < array_length(_wrappedLines); k++) {
        var _lineSegments = _wrappedLines[k]
        var _currentX = _x
        
        // Draw the segments for this single line
        for (var l = 0; l < array_length(_lineSegments); l++)
        {
            var _segment = _lineSegments[l]
            
            draw_set_color(_segment.color)
            draw_text(_currentX, _currentY, _segment.text)
            
            // Advance the x position for the next segment
            _currentX += string_width(_segment.text)
        }
        
        // Advance the y position for the next line, uses line height the same as draw_text_ext()
        _currentY += _lineHeight // + string_height(_testString)
    }
    
    // Reset the color after drawing
    draw_set_color(c_white)
}