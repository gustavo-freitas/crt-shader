/*
    CRT Shader by EasyMode
    License: GPL
*/

uniform int FrameDirection;
uniform int FrameCount;
uniform vec2 screen_texture_sz; // OutputSize
uniform vec2 color_texture_pow2_sz; // TextureSize
uniform vec2 color_texture_sz; // InputSize
uniform sampler2D color_texture;
uniform sampler2D mpass_texture;
varying vec2 TexCoord;

#define GAMMA_INPUT 2.4				//	def - 2.4

void main()
{
	vec3 diff = clamp(texture2D(mpass_texture, TexCoord).rgb - pow(texture2D(color_texture, TexCoord).rgb, vec3(GAMMA_INPUT)), 0.0, 1.0);
	gl_FragColor = vec4(diff, 1.0);
}