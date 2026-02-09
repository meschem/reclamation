varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_vTexelSize;  // Size of one pixel in texture coordinates
uniform float u_fGlowSize;  // How far the glow reaches (radius)
uniform vec4 u_vGlowColor;  // The color of the glow

void main() {
    vec4 base_col = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
    float alpha = 0.0;

    // Sample neighboring pixels to find the "edge"
    // We loop through a square area around the current pixel
    for(float i = -u_fGlowSize; i <= u_fGlowSize; i++) {
        for(float j = -u_fGlowSize; j <= u_fGlowSize; j++) {
            // Add up the alpha values of neighbors
            alpha += texture2D(gm_BaseTexture, v_vTexcoord + vec2(i, j) * u_vTexelSize).a;
        }
    }

    // Calculate the average alpha to create a blur effect
    // Total samples = $(GlowSize \times 2 + 1)^2$
    float total_samples = pow(u_fGlowSize * 2.0 + 1.0, 2.0);
    alpha /= total_samples;

    // The glow color with our calculated alpha
    vec4 glow_out = vec4(u_vGlowColor.rgb, alpha * u_vGlowColor.a);

    // Mix the original sprite on top of the glow
    // If base_col.a is 1, it shows the sprite. If 0, it shows the glow.
    gl_FragColor = mix(glow_out, base_col, base_col.a);
}
