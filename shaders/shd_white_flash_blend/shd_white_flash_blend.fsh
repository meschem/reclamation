//
// Simple passthrough fragment shader
//
varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform float u_flashRatio;

void main()
{
    vec4 baseColor = texture2D(gm_BaseTexture, v_vTexcoord);
	vec4 white = vec4(1.0, 1.0, 1.0, 1.0);
	vec3 blendedRGB = mix(baseColor.rgb, white.rgb, u_flashRatio);
	
	gl_FragColor = vec4(blendedRGB, baseColor.a * v_vColour.a);
}
