hostId = noone
age = 0

// Max number of points to store (affects visual trail length)
trailLength = 30
knuckling = 0
knuckleRate = 1

// Width of the trail line segments in pixels
trailWidthStart = 8
trailWidthEnd = 1

// Starting color of the trail
trailColor = c_white

// Starting alpha (opacity) of the newest trail segment
trailAlphaStart = 0.8
trailAlphaEnd = 0

// === Internal Storage ===
// Data structure to hold (x, y) coordinates for the trail.
// Points are stored sequentially: [x0, y0, x1, y1, x2, y2, ...]
pointList = ds_list_create()

fades = true
shrinks = true
