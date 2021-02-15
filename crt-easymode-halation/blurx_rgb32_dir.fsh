/*
    CRT Shader by EasyMode
    License: GPL
*/

uniform int FrameDirection;
uniform int FrameCount;
uniform vec2 screen_texture_sz; // OutputSize
uniform vec2 color_texture_pow2_sz; // TextureSize
uniform vec2 color_texture_sz; // InputSize
uniform sampler2D mpass_texture;
varying vec2 TexCoord;

// Higher value, more centered glow.
// Lower values might need more taps.

#define GLOW_FALLOFF 0.35
#define TAPS 4.
#define kernel(x) exp(-GLOW_FALLOFF * (x) * (x))

void main()
{
	vec3 col = vec3(0.0);
	float dx = 1.0 / color_texture_pow2_sz.x;

	float k_total = 0.;
	for (float i = -TAPS; i <= TAPS; i++)
		{
		float k = kernel(i);
		k_total += k;
		col += k * texture2D(mpass_texture, TexCoord + vec2(float(i) * dx, 0.0)).rgb;
		}
	gl_FragColor = vec4(col / k_total, 1.0);
}