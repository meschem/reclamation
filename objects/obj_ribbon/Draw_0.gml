var _listSize = ds_list_size(pointList)

// Need at least 4 entries (x1, y1, x2, y2) to draw one line segment
if (_listSize >= 4) {
    var _numSegments = (_listSize / 2) - 1
    
    // Calculate the amount of alpha to decrease per segment for a fade effect
	//var _alphaStep = trailAlphaStart / _maxSegments

    draw_set_color(trailColor)
    
    // Iterate over all line segments (x1, y1) to (x2, y2)
    // We increment by 2 because each point is two entries (x and y)
    for (var i = 0; i < _listSize - 2; i += 2) {
        var x1 = ds_list_find_value(pointList, i)
        var y1 = ds_list_find_value(pointList, i + 1)
        var x2 = ds_list_find_value(pointList, i + 2)
        var y2 = ds_list_find_value(pointList, i + 3)

        // Calculate fade alpha: starts at trail_alpha_start and moves toward 0
        var _currentSegment = i / 2;
		var _progress = _currentSegment / _numSegments
		
        var _currentAlpha = lerp(trailAlphaStart, trailAlphaEnd, _progress);
        var _currentWidth = lerp(trailWidthStart, trailWidthEnd, _progress);

        // Set the alpha for this segment
        draw_set_alpha(_currentAlpha)

        // Draw the segment using draw_line_width for a thick, rect-like trail
        draw_line_width(x1, y1, x2, y2, _currentWidth)
    }
    
    draw_set_alpha(1.0)
}
